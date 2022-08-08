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
        case isSearching
    }

    @Published var locations: [String] = []
    @Published var searchText: String = "" {
        didSet {
            state = .typing
        }
    }
    @Published var isTyping: Bool = false {
        didSet {
            if !isTyping {
                state = .normal
                searchLocation()
            }
        }
    }
    
    private var state: State = .normal
    
    
    func searchLocation() {
        if state != .typing {
            state = .isSearching
            
            let operation = GetLocationOperation(location: searchText) { [weak self] result in
                guard let self = self else { return }
                DispatchQueue.main.async {
                    self.state = .searchCompleted
                    switch result {
                    case .success(let location):
                        self.locations.append(location.name ?? "")
                    case .failure(let error):
                        break
                    }
                }
            }
            operation.start()
        }
    }
}
