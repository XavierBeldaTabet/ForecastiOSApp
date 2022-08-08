//
//  ContentView.swift
//  ForecastiOSApp
//
//  Created by Belda, Xavier on 6/8/22.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                VStack {
                    Spacer(minLength: 15)
                    Text("Search for a Location")
                        .font(.title)
                        .fontWeight(.light)
                        .foregroundColor(.white)
                    Spacer(minLength: 15)
                    SearchView()
                    Spacer(minLength: 15)
                }
                .hiddenNavigationBarStyle()
            }.preferredColorScheme(.dark)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
