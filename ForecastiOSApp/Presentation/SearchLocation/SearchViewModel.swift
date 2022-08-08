//
//  SearchViewModel.swift
//  ForecastiOSApp
//
//  Created by Belda, Xavier on 8/8/22.
//

import Foundation

class SearchViewModel: ObservableObject {
    private enum State {
        case normal
        case searchCompleted
        case typing
        case searching
    }

    @Published var filteredLocations: [Location] = []
    @Published var searchText: String = "" {
        didSet {
            state = .typing
            filterLocations()
        }
    }
    @Published var isTyping: Bool = false {
        didSet {
            if !isTyping {
                state = .normal
                filterLocations()
            }
        }
    }
    
    private var locations: [Location] = []
    private var state: State = .normal
    
    private var getLocationsBuilder: GetLocationsOperation.Builder
    private var getLocationBuilder: GetLocationOperation.Builder
    private var searchViewRouter: SearchViewRouterInterface
    
    private var totalPages: Int = -1
    private var actualPage: Int = 1
    
    init(getLocationsBuilder: @escaping GetLocationsOperation.Builder = GetLocationsOperation.defaultBuilder,
         getLocationBuilder: @escaping GetLocationOperation.Builder = GetLocationOperation.defaultBuilder,
         searchViewRouter: SearchViewRouterInterface = SearchViewRouter()
    ) {
        self.getLocationsBuilder = getLocationsBuilder
        self.getLocationBuilder = getLocationBuilder
        self.searchViewRouter = searchViewRouter
        getAllLocations(page: 1)
    }
    
    public func fetchMoreLocations() {
        if hasMorePages() && state != .searching {
            actualPage += 1
            getAllLocations(page: actualPage)
        }
    }
    
    public func hasMorePages() -> Bool {
        actualPage != totalPages
    }
    
    public func locationTapped(location: Location) -> ForecastLocationView {
        return navigateToForecast(location: location)
    }
    
    // MARK: - private func
    
    private func getAllLocations(page: Int) {
        state = .searching
        let operation = getLocationsBuilder(page) { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let locations):
                    self.totalPages = locations.totalPages ?? 0
                    self.locations.append(contentsOf: locations.embedded?.location ?? [])
                    self.filterLocations()
                case .failure(let error):
                    break
                }
                self.state = .searchCompleted
            }
        }
        
        operation.start()
    }
    
    private func searchLocation() {
        if state != .typing {
            state = .searching
            
            let operation = GetLocationOperation(location: searchText) { [weak self] result in
                guard let self = self else { return }
                DispatchQueue.main.async {
                    self.state = .searchCompleted
                    switch result {
                    case .success(let location):
                        self.locations.append(location)
                    case .failure(_):
                        break
                    }
                }
            }
            operation.start()
        }
    }
    
    private func filterLocations() {
        filteredLocations = locations.filter { location in
            location.name?.hasPrefix(searchText) ?? false || searchText == ""
        }
    }
}

// MARK: - Navigation

extension SearchViewModel {
    
    private func navigateToForecast(location: Location) -> ForecastLocationView {
        return searchViewRouter.navigateToForecastLocationView(location: location)
    }
}
