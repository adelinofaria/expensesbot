//
//  HomeView.swift
//  ExpensesBot
//
//  Created by Adelino Faria on 15/07/2024.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Button(action: {
            let model = ExpenseModel(id: UUID(),
                                     imageData: Data(),
                                     timestamp: .now,
                                     total: 123.23,
                                     currency: "USD",
                                     expenseDescription: "whole expense description")

            modelContext.insert(model)
        }) {
            Label("New Expense 📸", systemImage: "camera.viewfinder")
        }
    }
}

#Preview {
    HomeView()
}
