//
//  ListView.swift
//  ExpensesBot
//
//  Created by Adelino Faria on 15/07/2024.
//

import SwiftUI
import SwiftData

struct ListView: View {

    @Environment(\.modelContext) private var modelContext

    @Query(sort: \ExpenseModel.timestamp, order: .reverse) private var items: [ExpenseModel]

    @State var viewModel = ViewModel()

    var body: some View {

        let items = self.viewModel.filteredItems(items: self.items)

        List(items) { item in
            ListViewCell(expense: item)
            .swipeActions {
                Button("Delete", systemImage: "trash", role: .destructive) {
                    modelContext.delete(item)
                }
            }
        }
        .searchable(text: self.$viewModel.searchText)
    }
}
