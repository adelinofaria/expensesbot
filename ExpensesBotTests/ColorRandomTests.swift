//
//  ColorRandomTests.swift
//  ExpensesBotTests
//
//  Created by Adelino Faria on 18/07/2024.
//

import XCTest
import SwiftUI

@testable import ExpensesBot

final class ColorRandomTests: XCTestCase {

    @Environment(\.self) var environment

    func testRandom() throws {

        let color1 = Color.random()
        let color2 = Color.random()

        let resolvedColor1 = color1.resolve(in: environment)
        let resolvedColor2 = color2.resolve(in: environment)

        XCTAssertNotEqual(resolvedColor1.red, resolvedColor2.red)
        XCTAssertNotEqual(resolvedColor1.green, resolvedColor2.green)
        XCTAssertNotEqual(resolvedColor1.blue, resolvedColor2.blue)
    }
}
