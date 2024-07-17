//
//  HomeView.swift
//  ExpensesBot
//
//  Created by Adelino Faria on 15/07/2024.
//

import SwiftUI

struct HomeView: View {

    @State private var newExpenseScreenIsPresented = false

    var body: some View {

        Button {
            self.newExpenseScreenIsPresented.toggle()
        } label: {
            Label("New Expense", systemImage: "plus")
        }
        .sheet(isPresented: self.$newExpenseScreenIsPresented,
               onDismiss: didDismiss) {
            NavigationStack {
                NewExpenseScreen(isPresented: self.$newExpenseScreenIsPresented)
                    .navigationTitle("New Expense")
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            Button {
                                self.newExpenseScreenIsPresented.toggle()
                            } label: {
                                Text("Cancel")
                            }
                        }
                    }
            }
        }
    }

    func didDismiss() {

    }
}

#Preview {
    HomeView()
        .modelContainer(for: ExpenseModel.self, inMemory: true)
}
