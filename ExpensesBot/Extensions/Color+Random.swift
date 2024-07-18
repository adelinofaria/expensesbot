//
//  Color+Random.swift
//  ExpensesBot
//
//  Created by Adelino Faria on 18/07/2024.
//

import SwiftUI

extension Color {

    init(rgb: Int) {
        self.init(
            red: Double((rgb >> 16) & 0xFF), green: Double((rgb >> 8) & 0xFF),
            blue: Double(rgb & 0xFF))
    }

    static func random() -> Color {
        return Color(
            red: Double.random(in: 0...1), green: Double.random(in: 0...1),
            blue: Double.random(in: 0...1)
        )
    }
}
