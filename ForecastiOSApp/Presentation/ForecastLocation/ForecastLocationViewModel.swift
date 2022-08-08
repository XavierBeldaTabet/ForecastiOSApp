//
//  ForecastLocationViewModel.swift
//  ForecastiOSApp
//
//  Created by Belda, Xavier on 8/8/22.
//

import Foundation

class ForecastLocationViewModel: ObservableObject {
    
    private var getForecastBuilder: GetForecastForLocationOperation.Builder
    private var location: Location
    
    init(location: Location,
        getForecastBuilder: @escaping GetForecastForLocationOperation.Builder = GetForecastForLocationOperation.defaultBuilder) {
        self.location = location
        self.getForecastBuilder = getForecastBuilder
        
        getForecastForLocation()
    }
    
    private func getForecastForLocation() {
        let operation = getForecastBuilder(location.id ?? "") { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let forecast):
                break
            case .failure(let error):
                break
            }
        }
        
        operation.start()
    }
}
