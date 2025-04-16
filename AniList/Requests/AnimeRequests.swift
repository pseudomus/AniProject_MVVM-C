//
//  AnimeRequests.swift
//  AniList
//
//  Created by Luca Lacerda on 16/04/25.
//

import Foundation
import Combine
import Apollo
import AniAPI

final class AnimeRequester {

    enum Errors: Error {
        case requestError
    }

    static let shared: AnimeRequester = .init()

    private var currentAnimes: CurrentValueSubject<[AnimePreview], Errors> = .init([])
    private var cancellables: Apollo.Cancellable?
    private var currentPage = 0
    private var canRequestMorePages = true

    private init(){}
}

extension AnimeRequester: AnimeObserver {
    var animesPublisher: AnyPublisher<[AnimePreview], Errors> {
        currentAnimes
            .eraseToAnyPublisher()
    }
}

extension AnimeRequester: PageRequester {
    func requestNewPage() {
        guard canRequestMorePages else { return }
        currentPage += 1
        requestList()
    }

    private func requestList() {
        cancellables = Network.shared.apolloClient.fetch(query: AnimeListQuery(page: currentPage)) { [weak self] result in
            switch result {

            case .success(let listResult):
                if let animes = listResult.data?.page?.media {

                    let newAnimes = animes
                        .compactMap({$0})
                        .compactMap({ result in
                            AnimePreview(anime: result)
                        })

                    self?.currentAnimes.value.append(contentsOf: newAnimes)

                } else if listResult.errors != nil {

                    self?.currentAnimes.send(completion: .failure(.requestError))
                }

            case .failure(_):
                self?.currentAnimes.send(completion: .failure(.requestError))
            }
            self?.canRequestMorePages = true
        }
    }
}
