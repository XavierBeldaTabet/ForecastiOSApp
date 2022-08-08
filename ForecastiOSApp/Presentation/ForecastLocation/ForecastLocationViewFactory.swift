//
//  ForecastLocationFactory.swift
//  ForecastiOSApp
//
//  Created by Belda, Xavier on 8/8/22.
//

protocol ForecastLocationViewFactoryInterface {
    func make(location: Location) -> ForecastLocationView
}

class ForecastLocationViewFactory: ForecastLocationViewFactoryInterface {
    public init() {
        // Empty init
    }
    
    func make(location: Location) -> ForecastLocationView {
        let viewModel = ForecastLocationViewModel(location: location)
        return ForecastLocationView(viewModel: viewModel)
    }
}
