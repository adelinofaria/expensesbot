//
//  NewExpenseView.swift
//  ExpensesBot
//
//  Created by Adelino Faria on 16/07/2024.
//

import SwiftUI

struct NewExpenseView: View {

    @Environment(\.modelContext) private var modelContext

    @State private var presentImageSourcePickerView = false
    @State private var image: UIImage?

    @State private var id: UUID = .init()
    @State private var timestamp: Date = .now
    @State private var total: Double? = nil
    @State private var currency: String = Locale.current.currency?.identifier ?? "USD"
    @State private var expenseDescription: String = ""

    var body: some View {
        Form {
            Button {
                self.presentImageSourcePickerView.toggle()
            } label: {
                if let image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                } else {
                    Image(systemName: "photo")
                        .font(.largeTitle)
                        .foregroundStyle(.secondary)
                        .frame(height: 200)
                }
            }
            .sheet(isPresented: self.$presentImageSourcePickerView) {
                ImageSourcePickerView(selectedImage: $image)
            }
            Section {
                LabeledContent("id", value: self.id.uuidString)
                LabeledContent("Timestamp", value: self.timestamp.description)
            } header: {
                Text("Info")
            }
            Section {
                TextField("Expense total value", value: $total, format: .number)
                Picker("Currency", selection: $currency) {
                    ForEach(Locale.commonISOCurrencyCodes, id: \.self) {
                        Text($0)
                    }
                }

            } header: {
                Text("Total value")
            }
            Section {
                ZStack(alignment: .leading) {
                    if expenseDescription.isEmpty {
                        Text("Enter description")
                            .foregroundStyle(.secondary)
                            .padding(.leading, 5)
                    }
                    TextEditor(text: $expenseDescription)
                }
            } header: {
                Text("Description")
            }
            Section {

                Button("Save") {
                    if let imageData = self.image?.jpegData(compressionQuality: 1), let total {

                        let model = ExpenseModel(id: self.id,
                                                 imageData: imageData,
                                                 timestamp: self.timestamp,
                                                 total: total,
                                                 currency: self.currency,
                                                 expenseDescription: self.expenseDescription)

                        modelContext.insert(model)
                    }
                }
                .buttonStyle(PlainButtonStyle())
                .disabled(self.total == nil || self.image == nil)
                Button("Cancel") {

                }
                .buttonStyle(PlainButtonStyle())
                Button("Cancel") {

                }
                .buttonStyle(DefaultButtonStyle())
                Button("Cancel") {

                }
                .buttonStyle(BorderedButtonStyle())
                Button("Cancel") {

                }
                .buttonStyle(BorderlessButtonStyle())
                Button("Cancel") {

                }
                .buttonStyle(BorderedProminentButtonStyle())
            }
        }
    }
}

#Preview {
    NewExpenseView()
        .modelContainer(for: ExpenseModel.self, inMemory: true)
}
