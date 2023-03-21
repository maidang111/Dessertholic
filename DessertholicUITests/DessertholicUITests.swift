//
//  DessertholicUITests.swift
//  DessertholicUITests
//
//  Created by Mai Dang on 3/20/23.
//

import XCTest

final class DessertholicUITests: XCTestCase {

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
    
        app.launch()
        
        XCUIApplication().scrollViews.otherElements.buttons["Apam balik"].tap()

        XCUIApplication().otherElements.containing(.staticText, identifier:"---Ingredients---").children(matching: .image).matching(identifier: "Square").element(boundBy: 2).tap()
        
        let ingredientsElement = XCUIApplication().scrollViews.otherElements.containing(.staticText, identifier:"---Ingredients---").element
        ingredientsElement.tap()
        ingredientsElement.tap()
        
        ingredientsElement.swipeUp()
    
        XCUIApplication().buttons["Instructions"].tap()
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
