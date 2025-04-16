//
//  AnimePreview.swift
//  AniList
//
//  Created by Luca Lacerda on 16/04/25.
//

import Foundation
import AniAPI

struct AnimePreview: Identifiable, Hashable, Equatable {

    enum Status: String {
        case finished = "FINISHED",
             releasing = "RELEASING",
             notYetReleased = "NOT_YET_RELEASED",
             cancelled = "CANCELLED", 
             hiatus = "HIATUS"
    }

    let id: Int
    let image: URL
    let title: String
    let status: String
    let episodes: Int

    var currentStatus: Status? {
        return .init(rawValue: status)
    }

    init(id: Int, image: URL, title: String, status: String, episodes: Int) {
        self.id = id
        self.image = image
        self.title = title
        self.status = status
        self.episodes = episodes
    }
}

extension AnimePreview {
    init?(anime: AnimeListQuery.Data.Page.Medium) {
        let id = anime.id
        guard let episodes = anime.episodes,
              let title = anime.title?.romaji,
              let status = anime.status?.rawValue,
              let imageURLString = URL(string: (anime.coverImage?.medium)!)
        else {
            return nil
        }

        self.init(id: id,
                  image: imageURLString,
                  title: title,
                  status: status,
                  episodes: episodes)
    }
}
