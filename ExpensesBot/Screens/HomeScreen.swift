//
//  HomeScreen.swift
//  ExpensesBot
//
//  Created by Adelino Faria on 15/07/2024.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        HomeView()
    }
}

#Preview {
    HomeScreen()
        .modelContainer(for: ExpenseModel.self, inMemory: true)
}
