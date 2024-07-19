//
//  ExpensesBotUITests.swift
//  ExpensesBotUITests
//
//  Created by Adelino Faria on 15/07/2024.
//

import XCTest

final class ExpensesBotUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGoldenPath() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launchEnvironment["TESTING"] = "true"
        app.launch()

        let homeTab = app.tabBars.buttons["Home"]
        let historyTab = app.tabBars.buttons["History"]

        historyTab.tap()

        XCTAssertEqual(app.collectionViews.cells.count, 0)

        homeTab.tap()

        let addExpense = app.buttons["New Expense"]

        addExpense.tap()

        let listCells = app.collectionViews.cells

        // Tap Image cell
        let imageCell = listCells.firstMatch
        
        imageCell.tap()

        // Select photo library souce
        let photoLibraryButton = app.buttons["Photo library"]

        photoLibraryButton.tap()

        // Select first photo
        let firstImage = app.images.element(boundBy: 4)

        _ = firstImage.waitForExistence(timeout: 30)
        firstImage.tap()

        // Write total expense
        let totalValue = app.collectionViews.cells.element(boundBy: 2).textFields.firstMatch

        totalValue.tap()
        totalValue.typeText("123,123")
        totalValue.typeText("\n")

        // get generated UUID
        let uuidCell = app.collectionViews.cells.element(boundBy: 8)
        let uuidLabel = uuidCell.staticTexts.element(boundBy: 1).label
        let uuid = String(uuidLabel.dropFirst("id, ".count))

        // add expense
        let doneButton = app.buttons["Done"]

        doneButton.tap()

        // check history
        historyTab.tap()

        XCTAssertEqual(app.collectionViews.cells.count, 1)

        // navigate to detail
        let firstCell = app.collectionViews.cells.firstMatch

        firstCell.tap()

        let uuidStaticString = app.scrollViews.staticTexts.element(boundBy: 7).label

        XCTAssertEqual(uuidStaticString, uuid)
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
