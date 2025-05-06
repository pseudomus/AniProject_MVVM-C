//
//  AppCoordinatorImpl.swift
//  AniList
//
//  Created by Luca Lacerda on 22/04/25.
//

import SwiftUI

class AppCoordinatorImpl: AppCoordinatorProtocol {

    @Published var path: NavigationPath = NavigationPath()

    private lazy var animeListViewModel = AnimeListViewModel()

    func push(_ screen: Screen) {
        path.append(screen)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }

    @ViewBuilder
    func build(_ screen : Screen) -> some View{
        switch screen{
        case .animeList:
            AnimeListView(viewModel: animeListViewModel)
        case.animeDetail(let id):
            AnimeDetailView(viewModel: AnimeDetailViewModel(id: id))
        }
    }
}
