//
//  ExpenseModel.swift
//  ExpensesBot
//
//  Created by Adelino Faria on 15/07/2024.
//

import Foundation
import SwiftData

@Model
final class ExpenseModel {
    @Attribute(.unique) var id: UUID
    @Attribute(.externalStorage) var imageData: Data
    var timestamp: Date
    var total: Float
    var currency: String
    var expenseDescription: String

    init(id: UUID,
         imageData: Data,
         timestamp: Date,
         total: Float,
         currency: String,
         expenseDescription: String) {
        self.id = id
        self.imageData = imageData
        self.timestamp = timestamp
        self.total = total
        self.currency = currency
        self.expenseDescription = expenseDescription
    }
}
