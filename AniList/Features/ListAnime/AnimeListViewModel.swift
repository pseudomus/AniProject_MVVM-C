//
//  AnimeListViewModel.swift
//  AniList
//
//  Created by Luca Lacerda on 16/04/25.
//

import Foundation
import Combine

class AnimeListViewModel: AnimeListViewDataSource {

    @Published var searchText: String = ""
    @Published private(set) var animes: [AnimePreview] = []
    @Published private(set) var error: Error?

    private let pageRequester: PageRequester
    private let searchRequester: SearchRequester
    private let animeObserver: AnimeObserver
    private var subscriptions = Set<AnyCancellable>()
    private var firstPageLoaded: Bool = false

    init(
        AnimePageRequester:PageRequester = AnimeRequester.shared,
        animeObserver: AnimeObserver = AnimeRequester.shared,
        animeSearchRequester: SearchRequester = AnimeRequester.shared
    ) {
        self.pageRequester = AnimePageRequester
        self.animeObserver = animeObserver
        self.searchRequester = animeSearchRequester

        subscribeToPublisher()
        observeSearchText()
    }

    func loadFirstPage() {
        guard !firstPageLoaded else { return }
        pageRequester.requestNewPage()
        firstPageLoaded.toggle()
    }

    func loadNewPage(index: Int) {
        if animes.count <= index + 5 {
            if searchText == "" {
                pageRequester.requestNewPage()
            } else {
                searchRequester.requestNewSearchPage()
            }
        } 
    }

    func search(anime: String) {
        searchRequester.search(name: anime)
    }

}

private extension AnimeListViewModel {

    func subscribeToPublisher() {
        animeObserver
            .animesPublisher
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { [weak self] error in
                guard case .failure(let failure) = error else { return }
                self?.error = failure
            }, receiveValue: { [weak self] animes in
                self?.animes = animes
            })
            .store(in: &subscriptions)
    }

    func observeSearchText() {
        $searchText
            .removeDuplicates()
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .sink(receiveValue: { [weak self] searchText in
                if searchText.isEmpty {
                    self?.pageRequester.requestNewPage()
                } else {
                    self?.search(anime: searchText)
                }
            })
            .store(in: &subscriptions)
    }
}
