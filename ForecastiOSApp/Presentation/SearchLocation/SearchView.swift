//
//  SearchView.swift
//  ForecastiOSApp
//
//  Created by Belda, Xavier on 8/8/22.
//

import SwiftUI

struct SearchView: View {
    @StateObject private var viewModel = SearchViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            SearchBarView(searchText: $viewModel.searchText, isTyping: $viewModel.isTyping)
            List($viewModel.locations, id: \.self) { location in
                Text(location.wrappedValue)
            }
            .listStyle(GroupedListStyle())
            .onAppear() {
                UITableView.appearance().backgroundColor = UIColor.clear
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
