//
//  PresentationStyle.swift
//  AniList
//
//  Created by Luca Lacerda on 22/04/25.
//

import Foundation

enum Screen: Identifiable, Hashable {
    case animeList
    case animeDetail(Int)

    var id: Self { return self }
}
