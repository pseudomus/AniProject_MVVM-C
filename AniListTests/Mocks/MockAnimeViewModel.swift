//
//  MockAnimeViewModel.swift
//  AniListTests
//
//  Created by Luca Lacerda on 13/06/25.
//

import Foundation
@testable import AniList

final class MockAnimeViewModel: AnimeListViewDataSource {
    var animes: [AniList.AnimePreview] = []

    var searchText: String = ""

    var error: (any Error)?
    
    func loadNewPage(index: Int) {}
    
    func loadFirstPage() {}
    
    func search(anime: String) {}
    

}
