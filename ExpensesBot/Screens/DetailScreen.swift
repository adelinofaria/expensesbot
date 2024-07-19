//
//  DetailScreen.swift
//  ExpensesBot
//
//  Created by Adelino Faria on 15/07/2024.
//

import SwiftUI

struct DetailScreen: View {
    @Bindable var expense: ExpenseModel

    var body: some View {
        DetailView(expense: self.expense)
            .navigationTitle(DateFormatter.dateFormatter.string(from: self.expense.date))
    }
}
