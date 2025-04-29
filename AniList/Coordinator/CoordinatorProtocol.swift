//
//  CoordinatorProtocol.swift
//  AniList
//
//  Created by Luca Lacerda on 22/04/25.
//

import SwiftUI

protocol AppCoordinatorProtocol: ObservableObject {
    var path: NavigationPath { get set }

    func push(_ screen:  Screen)
    func pop()
    func popToRoot()
}
