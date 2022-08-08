//
//  SearchViewItem.swift
//  ForecastiOSApp
//
//  Created by Belda, Xavier on 8/8/22.
//

import SwiftUI

struct SearchItemView: View {
    @Binding var searchItem: String
    
    var body: some View {
        HStack(spacing: 0.0) {
            NavigationLink(destination: ForecastLocationView()) {
                Text(searchItem)
            }
        }
    }
}
