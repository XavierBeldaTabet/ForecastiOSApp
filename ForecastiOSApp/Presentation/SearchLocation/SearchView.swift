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
            List {
                ForEach($viewModel.filteredLocations, id: \.self) { item in
                    NavigationLink(destination: viewModel.locationTapped( location: item.wrappedValue)) {
                        Text(item.wrappedValue.name ?? "")
                    }
                }
                if viewModel.hasMorePages() {
                    ProgressView()
                        .onAppear {
                            viewModel.fetchMoreLocations()
                        }
                }
            }
            .listStyle(GroupedListStyle())
            .cornerRadius(30)
            .padding(.horizontal, 15)
            .onAppear() {
                UITableView.appearance().contentInset.top = -35
                UITableView.appearance().contentInset.bottom = -35
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
