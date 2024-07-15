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
    @Query(sort: \ExpenseModel.timestamp, order: .forward) private var items: [ExpenseModel]

    @State var searchText: String = ""

    var body: some View {

        List(items) {
            Text($0.id.uuidString)
        }
        .searchable(text: $searchText)
    }
}

#Preview {
    ListView()
}
