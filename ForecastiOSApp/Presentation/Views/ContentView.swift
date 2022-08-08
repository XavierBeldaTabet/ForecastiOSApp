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
                let colorScheme = [Color.blue,
                                   Color.orange]
                let gradient = Gradient(colors: colorScheme)
                let linearGradient = LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom)
                Rectangle()
                    .fill(linearGradient)
                    .blur(radius: 200, opaque: true)
                    .edgesIgnoringSafeArea(.all)
                SearchView()
            }
            .navigationTitle("Locations Search")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
