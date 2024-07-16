//
//  NewExpenseScreen.swift
//  ExpensesBot
//
//  Created by Adelino Faria on 15/07/2024.
//

import SwiftUI

struct NewExpenseScreen: View {
    var body: some View {
        NewExpenseView()
    }
}

#Preview {
    NewExpenseScreen()
        .modelContainer(for: ExpenseModel.self, inMemory: true)
}
