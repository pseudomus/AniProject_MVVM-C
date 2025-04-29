//
//  AppCoordinatorImpl.swift
//  AniList
//
//  Created by Luca Lacerda on 22/04/25.
//

import SwiftUI

class AppCoordinatorImpl: AppCoordinatorProtocol {

    @Published var path: NavigationPath = NavigationPath()

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
            AnimeListView()
        case.animeDetail(let id):
            AnimeDetailView()
        }
    }
}
