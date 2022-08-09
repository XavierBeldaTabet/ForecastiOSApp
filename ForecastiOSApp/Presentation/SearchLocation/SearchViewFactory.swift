//
//  SearchLocationViewFactory.swift
//  ForecastiOSApp
//
//  Created by Belda, Xavier on 9/8/22.
//

import Foundation

protocol SearchViewFactoryInterface {
    func make() -> SearchView
}

class SearchViewFactory: SearchViewFactoryInterface {
    public init() {
        // Empty init
    }
    
    func make() -> SearchView {
        let forecastFactory = ForecastLocationViewFactory()
        let viewRouter = SearchViewRouter(forecastLocationFactory: forecastFactory)
        let viewModel = SearchViewModel(searchViewRouter: viewRouter)
        return SearchView(viewModel: viewModel)
    }
}
