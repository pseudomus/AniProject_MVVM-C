//
//  AnimePreviewMock.swift
//  AniListTests
//
//  Created by Luca Lacerda on 12/06/25.
//

import Foundation
@testable import AniList

extension AnimePreview {
    static let mock: Self = .init(id: 16498,
                                  image: URL(string: "https://s4.anilist.co/file/anilistcdn/media/anime/cover/medium/bx16498-buvcRTBx4NSm.jpg")!,
                                  title: "Shingeki no Kyojin",
                                  status: "FINISHED",
                                  episodes: 25)

}
