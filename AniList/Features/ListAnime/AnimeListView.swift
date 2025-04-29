//
//  ContentView.swift
//  AniList
//
//  Created by Luca Lacerda on 02/04/25.
//

import SwiftUI
import AniAPI

protocol AnimeListViewDataSource: ObservableObject {
    var animes: [AnimePreview] { get }
    var searchText: String { get set }
    var error: Error? { get }

    func loadNewPage(index: Int)
    func loadFirstPage()

    func search(anime: String)
}

struct AnimeListView: View {

    @StateObject var vm = AnimeListViewModel()
    @EnvironmentObject var coordinator: AppCoordinatorImpl

    var body: some View {
        VStack {
            if vm.animes.isEmpty {
                EmptyView()
            } else {
                ScrollView {
                    LazyVGrid(columns: .init(repeating: .init(.flexible()), count: 2)) {
                        ForEach(Array(vm.animes.enumerated()), id: \.element) { index, anime in
                            Button {
                                coordinator.push(.animeDetail(anime.id))
                            } label :{
                                AnimeCell(anime: anime)
                            }
                            .onAppear { vm.loadNewPage(index: index) }
                        }.padding(7)
                    }
                    .animation(.easeInOut(duration: 0.3), value: vm.animes)
                }
            }
        }
        .navigationTitle("Anime List")
        .padding()
        .searchable(text: $vm.searchText)
        .onAppear {
            vm.loadFirstPage()
        }


    }
}

#Preview {
    AnimeListView()
}
