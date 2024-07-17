//
//  NewExpenseView.swift
//  ExpensesBot
//
//  Created by Adelino Faria on 16/07/2024.
//

import SwiftUI

struct NewExpenseView: View {

    @Environment(\.modelContext) private var modelContext

    @Binding var isPresented: Bool

    @State private var presentImageSourcePickerView = false
    @State private var image: UIImage?

    @State private var id: UUID = .init()
    @State private var timestamp: Date = .now
    @State private var total: Double? = nil
    @State private var currency: String = Locale.current.currency?.identifier ?? "USD"
    @State private var expenseDescription: String = ""

    var body: some View {
        Form {
            Section {
                Button {
                    self.presentImageSourcePickerView.toggle()
                } label: {
                    HStack {
                        VStack {
                            if let image {
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFit()
                            } else {
                                Image(systemName: "photo")
                                    .font(.largeTitle)
                                Spacer()
                                Text("Select your image")
                                    .font(.subheadline)
                            }
                        }
                        .padding()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                }
                .sheet(isPresented: self.$presentImageSourcePickerView) {
                    ImageSourcePickerView(isPresented: self.$presentImageSourcePickerView, image: $image)
                        .presentationDetents([.fraction(0.25)])
                        .presentationDragIndicator(.hidden)
                }
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
                LabeledContent("id", value: self.id.uuidString)
                LabeledContent("Timestamp", value: self.timestamp.description)
            } header: {
                Text("Generated")
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    if let imageData = self.image?.jpegData(compressionQuality: 1), let total {

                        let model = ExpenseModel(id: self.id,
                                                 imageData: imageData,
                                                 timestamp: self.timestamp,
                                                 total: total,
                                                 currency: self.currency,
                                                 expenseDescription: self.expenseDescription)

                        modelContext.insert(model)
                    }
                    
                    self.isPresented.toggle()
                } label: {
                    Text("Done")
                }
                .bold()
                .buttonStyle(DefaultButtonStyle())
                .disabled(self.total == nil || self.image == nil)
            }
        }
    }
}
