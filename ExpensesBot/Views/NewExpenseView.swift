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

    @State private var viewModel = ViewModel()

    var body: some View {
        Form {
            Section {
                Button {
                    self.viewModel.presentImageSourcePickerView.toggle()
                } label: {
                    HStack {
                        VStack {
                            if let image = self.viewModel.image {
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
                .sheet(isPresented: self.$viewModel.presentImageSourcePickerView) {
                    ImageSourcePickerView(isPresented: self.$viewModel.presentImageSourcePickerView, image: self.$viewModel.image)
                        .presentationDetents([.fraction(0.25)])
                        .presentationDragIndicator(.hidden)
                }
            }
            Section {
                TextField("Expense total value", value: self.$viewModel.total, format: .number)
                Picker("Currency", selection: self.$viewModel.currency) {
                    ForEach(Locale.commonISOCurrencyCodes, id: \.self) {
                        Text($0)
                    }
                }
            } header: {
                Text("Total value")
            }
            Section {
                ZStack(alignment: .leading) {
                    if self.viewModel.expenseDescription.isEmpty {
                        Text("Enter description")
                            .foregroundStyle(.secondary)
                            .padding(.leading, 5)
                    }
                    TextEditor(text: self.$viewModel.expenseDescription)
                }
            } header: {
                Text("Description")
            }
            Section {
                LabeledContent("id", value: self.viewModel.id.uuidString)
                LabeledContent("Timestamp", value: self.viewModel.timestamp.description)
            } header: {
                Text("Generated")
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    self.viewModel.saveExpense(modelContext: modelContext)
                    self.isPresented.toggle()
                } label: {
                    Text("Done")
                }
                .bold()
                .buttonStyle(DefaultButtonStyle())
                .disabled(self.viewModel.total == nil || self.viewModel.image == nil)
            }
        }
    }
}
