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

    enum States {
        case hasSearched
        case listing
    }

    static let shared: AnimeRequester = .init()

    private var currentAnimes: CurrentValueSubject<[AnimePreview], Errors> = .init([])
    private var cancellables: Apollo.Cancellable?
    private var currentPage = 0
    private var currentSearchPage = 0
    private var currentSearch = ""
    private var canRequestMorePages = true
    private var state: States = .listing
    private init(){}
}

extension AnimeRequester: AnimeObserver {
    var animesPublisher: AnyPublisher<[AnimePreview], Errors> {
        currentAnimes
            .eraseToAnyPublisher()
    }
}

//MARK: - Search and listing requests
extension AnimeRequester: PageRequester {

    func requestNewPage() {
        guard canRequestMorePages else { return }
        currentPage += 1
        switch state {
        case .hasSearched:
            self.currentSearchPage = 0
            self.state = .listing
            self.currentAnimes.value.removeAll()
            requestList()
        case .listing:
            requestList()
        }
    }

    private func requestList() {

        guard canRequestMorePages else { return }
        canRequestMorePages = false
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

extension AnimeRequester: SearchRequester {
    func search(name: String) {
        guard canRequestMorePages else { return }
        self.currentAnimes.value.removeAll()
        self.currentSearch = name
        currentSearchPage = 1
        currentPage = 0
        requestSearchList(search: name)
        self.state = .hasSearched
    }

    func requestNewSearchPage() {
        guard canRequestMorePages else { return }
        currentSearchPage += 1
        print("entrou2")
        requestSearchList(search: currentSearch)
    }

    private func requestSearchList(search: String) {

        guard canRequestMorePages else { return }
        canRequestMorePages = false
        cancellables = Network.shared.apolloClient.fetch(query: AnimeSearchQuery(search: search, page: currentSearchPage)) { [weak self] result in
            switch result {
            case .success(let listResult):
                if let animes = listResult.data?.page?.media {
                    print(animes)
                    let newAnimes = animes
                        .compactMap ({$0})
                        .compactMap({ result in
                            AnimePreview(anime: result)
                        })
                    print(newAnimes)
                    self?.currentAnimes.value.append(contentsOf: newAnimes)
                }
            case .failure(_):
                print("erros")
                self?.currentAnimes.send(completion: .failure(.requestError))
            }
            self?.canRequestMorePages = true
        }
    }
}
