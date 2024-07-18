//
//  ListViewModel.swift
//  ExpensesBot
//
//  Created by Adelino Faria on 18/07/2024.
//

import Foundation

extension ListView {

    @Observable
    class ViewModel {

        var searchText: String = ""

        func filteredItems(items: [ExpenseModel]) -> [ExpenseModel] {

            let items = items.filter {
                if self.searchText.isEmpty == false {
                    return $0.id.uuidString.contains(self.searchText) || $0.expenseDescription.contains(self.searchText)
                } else {
                    return true
                }
            }

            return items
        }
    }
}
