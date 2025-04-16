//
//  ContentView.swift
//  AniList
//
//  Created by Luca Lacerda on 02/04/25.
//

import SwiftUI
struct AnimeListView: View {
    var network: Network = Network.shared
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)

            Text("Hello, world!")
        }
        .padding()

    }
}

#Preview {
    AnimeListView()
}
