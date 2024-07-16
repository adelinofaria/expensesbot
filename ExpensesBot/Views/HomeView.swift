//
//  HomeView.swift
//  ExpensesBot
//
//  Created by Adelino Faria on 15/07/2024.
//

import SwiftUI

struct HomeView: View {

    @State private var presentNewExpenseScreen = false

    var body: some View {

        Button {
            self.presentNewExpenseScreen.toggle()
        } label: {
            Label("New Expense", systemImage: "plus")
        }
        .sheet(isPresented: self.$presentNewExpenseScreen,
               onDismiss: didDismiss) {
            NavigationStack {
                NewExpenseScreen()
                    .navigationTitle("New Expense")
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            Button {
                                self.presentNewExpenseScreen.toggle()
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
