//
//  ContentView.swift
//  AniList
//
//  Created by Luca Lacerda on 02/04/25.
//

import SwiftUI
struct ContentView: View {
    var network: Network = Network()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)

            Text("Hello, world!")
        }
        .onAppear(perform: {
            Task {
                await network.fetchAnimeData()
            }
        })
        .padding()

    }
}

#Preview {
    ContentView()
}
