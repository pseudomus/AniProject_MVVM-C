//
//  AnimeDetailMock.swift
//  AniListTests
//
//  Created by Luca Lacerda on 12/06/25.
//

import Foundation
@testable import AniList

extension AnimeDetail {
    static let mock: Self = .init(id: 16498,
                                  image: URL(string: "https://s4.anilist.co/file/anilistcdn/media/anime/cover/medium/bx16498-buvcRTBx4NSm.jpg")!,
                                  title: "Shingeki no Kyojin",
                                  status: "FINISHED",
                                  season: "SPRING",
                                  episodes: 25,
                                  description: """
                                      Several hundred years ago, humans were nearly exterminated by titans. Titans are typically several stories tall, seem to have no intelligence, devour human beings and, worst of all, seem to do it for the pleasure rather than as a food source. A small percentage of humanity survived by walling themselves in a city protected by extremely high walls, even taller than the biggest of titans.<br><br>
                                      Flash forward to the present and the city has not seen a titan in over 100 years. Teenage boy Eren and his foster sister Mikasa witness something horrific as the city walls are destroyed by a colossal titan that appears out of thin air. As the smaller titans flood the city, the two kids watch in horror as their mother is eaten alive. Eren vows that he will murder every single titan and take revenge for all of mankind.<br><br>
                                      """,
                                  genres: ["Action", "Drama", "Fantasy", "Mystery"],
                                  averageScore: 84)
}
