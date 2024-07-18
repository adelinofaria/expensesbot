//
//  DateFormatterReuseTests.swift
//  ExpensesBotTests
//
//  Created by Adelino Faria on 18/07/2024.
//

import XCTest

@testable import ExpensesBot

final class DateFormatterReuseTests: XCTestCase {

    func testDefaultFormatter() throws {

        let date = Date(timeIntervalSince1970: 1721331096)
        let dateFormatter = DateFormatter.dateFormatter

        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(identifier: "UTC")

        XCTAssertEqual(dateFormatter.string(from: date), "7/18/24, 7:31 PM")
    }
}
