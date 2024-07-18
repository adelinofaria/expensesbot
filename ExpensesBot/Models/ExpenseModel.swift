//
//  ExpenseModel.swift
//  ExpensesBot
//
//  Created by Adelino Faria on 15/07/2024.
//

import Foundation
import SwiftUI
import SwiftData

@Model
final class ExpenseModel {
    @Attribute(.unique) var id: UUID
    @Attribute(.externalStorage) var imageData: Data
    var timestamp: Date
    var total: Double
    var currency: String
    var expenseDescription: String

    @Transient
    var image: UIImage? {
        get {
            UIImage(data: self.imageData)
        }
    }

    @Transient
    var thumbnail: UIImage? {
        get {
            return self.image?.resized(maxSize: CGSize(width: 44.0, height: 44.0))
        }
    }

    init(id: UUID,
         imageData: Data,
         timestamp: Date,
         total: Double,
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
