//
//  HomeView.swift
//  ExpensesBot
//
//  Created by Adelino Faria on 15/07/2024.
//

import SwiftUI
import SwiftData

struct HomeView: View {

    @Environment(\.modelContext) private var modelContext

    @Query(sort: \ExpenseModel.timestamp, order: .reverse) private var items: [ExpenseModel]

    @State private var newExpenseScreenIsPresented = false

    var body: some View {
        let totalsPerCurrencies = self.items.reduce([String: [ExpenseModel]]()) { partialResult, expense in

            var partialResult = partialResult
            var items = partialResult[expense.currency] ?? []

            items.append(expense)

            partialResult[expense.currency] = items

            return partialResult
        }.map {
            let total = $0.value.reduce(Double()) { partialResult, expense in
                partialResult + expense.total
            }
            return (key: $0.key, value: total)
        }

        ScrollView {
            VStack(alignment: .leading) {
                Spacer()
                Text("Total Expenses")
                    .font(.title)
                Spacer()
                ForEach(totalsPerCurrencies, id: \.key) {
                    Text($0.value, format: .currency(code: $0.key))
                        .font(.subheadline)
                }
            }
            .padding()
        }

        Button {
            self.newExpenseScreenIsPresented.toggle()
        } label: {
            Label("New Expense", systemImage: "plus")
                .font(.title2)
                .frame(maxWidth: .infinity)
        }
        .padding()
        .buttonStyle(BorderedProminentButtonStyle())
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
