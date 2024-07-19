//
//  NewExpenseViewModelTests.swift
//  ExpensesBotTests
//
//  Created by Adelino Faria on 18/07/2024.
//

import XCTest
import SwiftData

@testable import ExpensesBot

final class NewExpenseViewModelTests: XCTestCase {

    @MainActor
    func testModelPersistence() async throws {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: ExpenseModel.self, configurations: config)

        let viewModel = NewExpenseView.ViewModel()

        let id = UUID()
        let image = UIImage.createImage()
        let timestamp = Date.now
        let total: Double = 123
        let currency = "USD"
        let expenseDescription = "description"

        viewModel.id = id
        viewModel.image = image
        viewModel.total = total
        viewModel.currency = currency
        viewModel.date = timestamp
        viewModel.expenseDescription = expenseDescription
        viewModel.created = timestamp

        viewModel.saveExpense(modelContext: container.mainContext)

        let fetchDescriptor = FetchDescriptor<ExpenseModel>()

        let expenses = try? container.mainContext.fetch(fetchDescriptor)

        XCTAssertEqual(expenses?.count, 1)
        XCTAssertEqual(expenses?.first?.id, id)
        XCTAssertEqual(expenses?.first?.imageData, image?.jpegData(compressionQuality: 1.0))
        XCTAssertEqual(expenses?.first?.total, total)
        XCTAssertEqual(expenses?.first?.currency, currency)
        XCTAssertEqual(expenses?.first?.date, timestamp)
        XCTAssertEqual(expenses?.first?.expenseDescription, expenseDescription)
        XCTAssertEqual(expenses?.first?.created, timestamp)
    }
}
