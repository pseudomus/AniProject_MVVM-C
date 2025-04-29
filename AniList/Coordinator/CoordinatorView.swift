//
//  CoordinatorView.swift
//  AniList
//
//  Created by Luca Lacerda on 22/04/25.
//

import SwiftUI

struct CoordinatorView: View {

    @StateObject var appCoordinator = AppCoordinatorImpl()

    var body: some View {
        NavigationStack(path: $appCoordinator.path) {
            appCoordinator.build(.animeList)
                .navigationDestination(for: Screen.self) { screen in
                    appCoordinator.build(screen)
                }
        }.environmentObject(appCoordinator)
    }
}
