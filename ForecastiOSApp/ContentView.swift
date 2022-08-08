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
                let colorScheme = [Color.black,
                                   Color(red: 20/255, green: 31/255, blue: 78/255),
                                   Color(red: 141/255, green: 87/255, blue: 151/255)]
                let gradient = Gradient(colors: colorScheme)
                let linearGradient = LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom)
                Rectangle()
                    .fill(linearGradient)
                    .blur(radius: 200, opaque: true)
                    .edgesIgnoringSafeArea(.all)
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
