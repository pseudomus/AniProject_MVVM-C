//
//  GraphQlTest.swift
//  AniList
//
//  Created by Luca Lacerda on 02/04/25.
//

import Foundation

struct GraphQl: Codable {
    var query: String
}

class Network {
    func fetchAnimeData() async {
        guard let url = URL(string: "https://graphql.anilist.co") else { return }
        let query = """
    query {
      Page(page: 1, perPage: 10) {
        media(type: ANIME, sort: POPULARITY_DESC) {
          id
          title {
            romaji
            english
            native
          }
          episodes
          status
          coverImage {
            large
            medium
          }
        }
      }
    }
    """
        let requestBody = GraphQl(query: query)
        guard let jsonData = try? JSONEncoder().encode(requestBody) else { return }
        var request = URLRequest(url: url)
           request.httpMethod = "POST"
           request.setValue("application/json", forHTTPHeaderField: "Content-Type")
           request.httpBody = jsonData
        do {
               let (data, _) = try await URLSession.shared.data(for: request)
               if let json = try? JSONSerialization.jsonObject(with: data, options: []) {
                   print(json)
               }
           } catch {
               print("Erro na requisição: \(error)")
           }
    }
}
