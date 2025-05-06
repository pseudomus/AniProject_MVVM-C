//
//  AnimeDetailViewModel.swift
//  AniList
//
//  Created by Luca Lacerda on 01/05/25.
//

import Foundation
import SwiftUI

class AnimeDetailViewModel: AnimeDetailVewDataSource{

    @Published var anime: AnimeDetail?
    var detailRequester: DetailRequester
    let id: Int

    func onTaskCalled() {
        Task(priority: .userInitiated) {
            let detail = try await detailRequester.requestDetail(id: id)

            await  MainActor.run {
                self.anime = detail
            }
        }
    }

    init(id: Int) {
        self.detailRequester = AnimeRequester.shared
        self.id = id
    }
}
