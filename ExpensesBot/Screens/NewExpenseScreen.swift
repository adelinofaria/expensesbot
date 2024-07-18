//
//  NewExpenseScreen.swift
//  ExpensesBot
//
//  Created by Adelino Faria on 15/07/2024.
//

import SwiftUI

struct NewExpenseScreen: View {
    @Binding var isPresented: Bool

    var body: some View {
        NewExpenseView(isPresented: self.$isPresented)
    }
}
