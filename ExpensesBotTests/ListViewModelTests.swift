//
//  ListViewModelTests.swift
//  ExpensesBotTests
//
//  Created by Adelino Faria on 18/07/2024.
//

import XCTest

@testable import ExpensesBot

final class ListViewModelTests: XCTestCase {

    func testFilteredItems() throws {

        let viewModel = ListView.ViewModel()

        let items = [
            self.model(description: "big description"),
            self.model(description: "small description"),
            self.model(description: "nothing"),
            self.model(description: ""),
        ]

        let expectations = [
            "description": [
                "big description",
                "small description"
            ],
            "big": [
                "big description"
            ],
            "nothing": [
                "nothing"
            ],
            "": [
                "big description",
                "small description",
                "nothing",
                ""
            ],
            "somethingelse": []
        ]

        expectations.forEach {
            viewModel.searchText = $0.key

            let filtered = viewModel.filteredItems(items: items).map { $0.expenseDescription }

            XCTAssertEqual(filtered, $0.value)
        }
    }
}

extension ListViewModelTests {

    func model(description: String) -> ExpenseModel {
        ExpenseModel(id: UUID(),
                     imageData: Data(),
                     timestamp: .now,
                     total: 123,
                     currency: "USD",
                     expenseDescription: description)
    }
}
