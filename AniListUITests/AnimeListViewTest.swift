//
//  AniListUITests.swift
//  AniListUITests
//
//  Created by Luca Lacerda on 02/04/25.
//

import XCTest

final class AniListUITests: XCTestCase {

    var app: XCUIApplication?

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app?.launch()
    }

    override func tearDownWithError() throws {
        super.tearDown()
        app = nil
    }

    @MainActor
    func testnavigation() throws {
        app?/*@START_MENU_TOKEN@*/.images.element(boundBy: 1)/*[[".images.element(boundBy: 1)",".buttons[\"Shingeki no Kyojin\"].images.firstMatch"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.tap()
        app?/*@START_MENU_TOKEN@*/.buttons["Anime List"]/*[[".navigationBars.buttons[\"Anime List\"]",".buttons.firstMatch",".buttons[\"Anime List\"]"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()

    }

    @MainActor
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }

    @MainActor
    func testSearch() throws {
        let app = XCUIApplication()
        app.searchFields["Search"].tap()
        app/*@START_MENU_TOKEN@*/.searchFields["Search"]/*[[".navigationBars.searchFields[\"Search\"]",".searchFields",".containing(.image, identifier: \"magnifyingglass\").firstMatch",".firstMatch",".searchFields[\"Search\"]"],[[[-1,4],[-1,1,1],[-1,0]],[[-1,3],[-1,2]]],[0]]@END_MENU_TOKEN@*/.typeText("One piece")
        app/*@START_MENU_TOKEN@*/.buttons["ONE PIECE (Movie)"].images.firstMatch/*[[".images.element(boundBy: 1)",".buttons[\"ONE PIECE (Movie)\"].images.firstMatch"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.buttons["Anime List"]/*[[".navigationBars.buttons[\"Anime List\"]",".buttons.firstMatch",".buttons[\"Anime List\"]"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.buttons["Cancel"]/*[[".buttons.containing(.staticText, identifier: \"Cancel\").firstMatch",".navigationBars.buttons[\"Cancel\"]",".buttons[\"Cancel\"]"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    }
}
