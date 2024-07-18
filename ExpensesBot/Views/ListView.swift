//
//  ListView.swift
//  ExpensesBot
//
//  Created by Adelino Faria on 15/07/2024.
//

import SwiftUI
import SwiftData

struct ListView: View {

    @Environment(\.isSearching) var isSearching
    @Environment(\.modelContext) private var modelContext

    @Query(sort: \ExpenseModel.timestamp, order: .reverse) private var items: [ExpenseModel]

    @State var searchText: String = ""

    var body: some View {

        let items = self.items.filter {
            if self.searchText.isEmpty == false {
                return $0.id.uuidString.contains(self.searchText) || $0.expenseDescription.contains(self.searchText)
            } else {
                return true
            }
        }

        List(items) { item in
            ListViewCell(expense: item)
            .swipeActions {
                Button("Delete", systemImage: "trash", role: .destructive) {
                    modelContext.delete(item)
                }
            }
        }
        .searchable(text: $searchText)
    }

}

#Preview {
    ListView()
        .modelContainer(for: ExpenseModel.self, inMemory: true)
}
