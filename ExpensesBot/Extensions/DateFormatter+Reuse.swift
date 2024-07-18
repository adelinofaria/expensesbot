//
//  DateFormatter+Reuse.swift
//  ExpensesBot
//
//  Created by Adelino Faria on 17/07/2024.
//

import Foundation

extension DateFormatter {

    static var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()

        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short

        return dateFormatter
    }
}
