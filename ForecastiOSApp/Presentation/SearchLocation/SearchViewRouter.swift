//
//  SearchViewRouter.swift
//  ForecastiOSApp
//
//  Created by Belda, Xavier on 8/8/22.
//

import Foundation

protocol SearchViewRouterInterface {
    func navigateToForecastLocationView(location: Location) -> ForecastLocationView
}

class SearchViewRouter: SearchViewRouterInterface {
    
    private var forecastLocationFactoryInterface: ForecastLocationViewFactoryInterface
    
    init(forecastLocationFactory: ForecastLocationViewFactoryInterface = ForecastLocationViewFactory()) {
        self.forecastLocationFactoryInterface = forecastLocationFactory
    }
    
    func navigateToForecastLocationView(location: Location) -> ForecastLocationView {
        return forecastLocationFactoryInterface.make(location: location)
    }
}
