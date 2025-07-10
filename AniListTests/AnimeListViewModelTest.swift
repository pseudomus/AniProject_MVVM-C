//
//  AniListTests.swift
//  AniListTests
//
//  Created by Luca Lacerda on 02/04/25.
//

import XCTest
import Combine
@testable import AniList

final class AnimeListViewModelTest: XCTestCase {

    private var sut: AnimeListViewModel!
    private var spyPaginationRequester: SpyPageRequester!
    private var spySearchRequester: SpySearchRequester!
    private var mockAnimeObserver: MockAnimeObserver!
    private var cancellable: Cancellable!

    override func setUpWithError() throws {
        super.setUp()
        spyPaginationRequester = .init()
        spySearchRequester = .init()
        mockAnimeObserver = .init(anime: [.mock])
        sut = .init(AnimePageRequester: spyPaginationRequester,
                    animeObserver: mockAnimeObserver,
                    animeSearchRequester: spySearchRequester)

    }

    override func tearDownWithError() throws {
        spyPaginationRequester = nil
        mockAnimeObserver = nil
        mockAnimeObserver = nil
        super.tearDown()
    }

    func testErrorInitialValue() {
        XCTAssertNil(sut.error)
    }

    func testLoadFiirstPage() {
        sut.loadFirstPage()
        XCTAssert(spyPaginationRequester.requestNewPageCalled)
    }

    func testLoadNewPage() {
        sut.loadNewPage(index: 2)
        XCTAssert(spyPaginationRequester.requestNewPageCalled)
    }

    func testLoadSearchPage() {
        sut.searchText = "test"
        sut.loadNewPage(index: 2)
        XCTAssert(spySearchRequester.requestNewSearchPageCalled)
    }

    func testSearchText() {
        sut.search(anime: "teste")
        XCTAssert(spySearchRequester.searchedName)
    }

    func testCurrentAnimes() {
        XCTAssertEqual(sut.animes, [])

        let expectation = XCTestExpectation(description: "Waiting for observer to receive changes")

        cancellable = sut.objectWillChange.sink(receiveValue: { Void in
            expectation.fulfill()
        })

        wait(for: [expectation], timeout: 1)

        XCTAssertEqual(sut.animes, [.mock])
    }
}

private extension AnimeListViewModelTest {
    final class SpyPageRequester: PageRequester {
        private(set) var requestNewPageCalled = false

        func requestNewPage() {
            requestNewPageCalled = true
        }
    }

    final class SpySearchRequester: SearchRequester {
        private(set) var requestNewSearchPageCalled = false
        private(set) var searchedName = false

        func requestNewSearchPage() {
            requestNewSearchPageCalled = true
        }

        func search(name: String) {
            searchedName = true
        }
    }

    final class MockAnimeObserver: AnimeObserver {
        var animesPublisher: AnyPublisher<[AniList.AnimePreview], AniList.AnimeRequester.Errors> {
            animeCurrentValueSubject.eraseToAnyPublisher()
        }

        var animeCurrentValueSubject: CurrentValueSubject<[AniList.AnimePreview], AniList.AnimeRequester.Errors>

        init(anime: [AnimePreview]) {
            self.animeCurrentValueSubject = .init(anime)
        }
    }
}
