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
    var total: Double
    var currency: String
    var date: Date
    var expenseDescription: String
    var created: Date

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
         total: Double,
         currency: String,
         date: Date,
         expenseDescription: String,
         created: Date) {
        self.id = id
        self.imageData = imageData
        self.total = total
        self.currency = currency
        self.date = date
        self.expenseDescription = expenseDescription
        self.created = created
    }
}
