//
//  DetailView.swift
//  ExpensesBot
//
//  Created by Adelino Faria on 16/07/2024.
//

import SwiftUI

struct DetailView: View {
    @Bindable var expense: ExpenseModel

    var body: some View {
        Text(self.expense.id.uuidString)
        Text(self.expense.timestamp.description)
        Text(self.expense.total.description)
        Text(self.expense.currency.description)
        Text(self.expense.expenseDescription)
    }
}
