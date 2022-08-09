//
//  SearchBar.swift
//  ForecastiOSApp
//
//  Created by Belda, Xavier on 8/8/22.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    @Binding var isTyping: Bool
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.gray)
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search...", text: $searchText)  { startedEditing in
                    if startedEditing {
                        withAnimation {
                            isTyping = true
                        }
                    }
                } onCommit: {
                    withAnimation {
                        isTyping = false
                    }
                }.foregroundColor(.white)
            }
            .padding(.leading, 13)
        }
        .frame(height: 40)
        .cornerRadius(13)
        .padding()
    }
}
