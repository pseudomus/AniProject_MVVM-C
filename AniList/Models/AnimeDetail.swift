//
//  AnimeDetail.swift
//  AniList
//
//  Created by Luca Lacerda on 16/04/25.
//

import Foundation
import SwiftUI
import AniAPI

struct AnimeDetail {

    enum Status: String {
        case finished = "FINISHED",
             releasing = "RELEASING",
             notYetReleased = "NOT YET RELEASED",
             cancelled = "CANCELLED",
             hiatus = "HIATUS"
    }

    enum Season: String {
        case winter
        case spring
        case summer
        case fall
    }

    let id: Int
    let image: URL
    let title: String
    let status: String
    let season: String
    let episodes: Int
    let description: String
    let genres: [String]
    let averageScore: Int

    var currentStatus: Status? {
        return .init(rawValue: status)
    }

    var currentSeason: Season? {
        return . init(rawValue: season)
    }

    init(id: Int,
         image: URL,
         title: String,
         status: String,
         season: String,
         episodes: Int,
         description: String,
         genres: [String],
         averageScore: Int)
    {
        self.id = id
        self.image = image
        self.title = title
        self.status = status
        self.season = season
        self.episodes = episodes
        self.description = description
        self.genres = genres
        self.averageScore = averageScore
    }
}

extension AnimeDetail {
    init?(anime: AnimeDetailQuery.Data.Media){
        let id = anime.id
        let genres = anime.genres?.compactMap({$0}) ?? []
        guard let episodes = anime.episodes,
              let title = anime.title?.romaji,
              let status = anime.status?.rawValue,
              let imageURLString = URL(string: (anime.coverImage?.large)!),
              let description = anime.description,
              let season = anime.season?.rawValue,
              let averageScore = anime.averageScore
        else {
            return nil
        }

        self.init(id: id,
                  image: imageURLString,
                  title: title,
                  status: status,
                  season: season,
                  episodes: episodes,
                  description: description,
                  genres: genres,
                  averageScore: averageScore)
    }
}

extension AnimeDetail.Status {
    var color: Color {
        switch self {
        case .finished:
            return .red
        case .releasing:
            return .green
        case .notYetReleased:
            return .gray
        case .cancelled:
            return .red
        case .hiatus:
            return .yellow
        }
    }
}
