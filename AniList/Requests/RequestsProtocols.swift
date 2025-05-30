//
//  RequestsProtocols.swift
//  AniList
//
//  Created by Luca Lacerda on 16/04/25.
//

import Foundation
import Combine

protocol PageRequester {
    func requestNewPage()
}

protocol DetailRequester {
    func requestDetail(id: Int) async throws -> AnimeDetail
}

protocol SearchRequester {
    func search(name: String)
    func requestNewSearchPage()
}

protocol AnimeObserver {
    var animesPublisher: AnyPublisher<[AnimePreview], AnimeRequester.Errors> { get }
}
