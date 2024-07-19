//
//  DetailView.swift
//  ExpensesBot
//
//  Created by Adelino Faria on 16/07/2024.
//

import SwiftUI

struct DetailView: View {
    @Bindable var expense: ExpenseModel

    var body: some View {
        ScrollView {
            VStack {
                if let image = self.expense.image {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } else {
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
                Spacer()
                Text("Total")
                    .bold()
                Text(self.expense.total, format: .currency(code: self.expense.currency))
                Spacer()
                Text("Description")
                    .bold()
                Text(self.expense.expenseDescription)
                Spacer()
                Text("Date")
                    .bold()
                Text(DateFormatter.dateFormatter.string(from: self.expense.date))
                Spacer()
                Spacer()
                Text("Info")
                    .bold()
                Text(self.expense.id.uuidString)
                Text(self.expense.created.description)
            }
        }
    }
}
