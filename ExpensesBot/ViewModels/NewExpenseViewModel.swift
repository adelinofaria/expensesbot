//
//  NewExpenseViewModel.swift
//  ExpensesBot
//
//  Created by Adelino Faria on 18/07/2024.
//

import SwiftUI
import SwiftData

extension NewExpenseView {

    @Observable
    class ViewModel {

        var presentImageSourcePickerView = false
        var image: UIImage?

        var id: UUID = .init()
        var total: Double? = nil
        var currency: String = Locale.current.currency?.identifier ?? "USD"
        var date: Date = .now
        var expenseDescription: String = ""
        var created: Date = .now

        func saveExpense(modelContext: ModelContext) {

            if let imageData = self.image?.jpegData(compressionQuality: 1),
               let total = self.total {

                let model = ExpenseModel(id: self.id,
                                         imageData: imageData,
                                         total: total,
                                         currency: self.currency,
                                         date: self.date,
                                         expenseDescription: self.expenseDescription,
                                         created: self.created)

                modelContext.insert(model)
            }
        }
    }
}
