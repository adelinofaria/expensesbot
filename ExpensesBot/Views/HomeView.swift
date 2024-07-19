//
//  HomeView.swift
//  ExpensesBot
//
//  Created by Adelino Faria on 15/07/2024.
//

import SwiftUI
import SwiftData
import Charts

struct HomeView: View {

    @Environment(\.modelContext) private var modelContext

    @Query(sort: \ExpenseModel.created, order: .reverse) private var items: [ExpenseModel]

    @State private var newExpenseScreenIsPresented = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Total Expenses")
                    .font(.title)
                Spacer()
                Chart {
                    ForEach(self.items) { item in
                        BarMark(
                            x: .value("Currency", item.currency),
                            y: .value("Total", item.total)
                        )
                        .foregroundStyle(Color.random())
                    }
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
        .sheet(isPresented: self.$newExpenseScreenIsPresented) {
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
}
