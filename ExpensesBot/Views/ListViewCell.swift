//
//  ListViewCell.swift
//  ExpensesBot
//
//  Created by Adelino Faria on 17/07/2024.
//

import SwiftUI

struct ListViewCell: View {
    @Bindable var expense: ExpenseModel

    var body: some View {
        NavigationLink {
            DetailScreen(expense: self.expense)
        } label: {
            HStack {
                if let thumbnail = self.expense.thumbnail {
                    Image(uiImage: thumbnail)
                } else {
                    Image(systemName: "photo")
                }
                VStack {
                    Text(DateFormatter.dateFormatter.string(from: self.expense.date))
                    Text(self.expense.id.uuidString)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
            }
        }
    }
}
