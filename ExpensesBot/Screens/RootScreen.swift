//
//  RootScreen.swift
//  ExpensesBot
//
//  Created by Adelino Faria on 15/07/2024.
//

import SwiftUI

struct RootScreen: View {
    var body: some View {
        TabView {
            NavigationStack {
                HomeScreen()
                    .navigationTitle("Expenses Bot++")
            }
            .tabItem {
                Label("Home", systemImage: "house")
            }
            NavigationStack {
                ListScreen()
                    .navigationTitle("History")
            }
            .tabItem {
                Label("History", systemImage: "clock")
            }
        }
    }
}

#Preview {
    RootScreen()
}
