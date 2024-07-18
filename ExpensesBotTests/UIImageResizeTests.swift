//
//  UIImageResizeTests.swift
//  ExpensesBotTests
//
//  Created by Adelino Faria on 18/07/2024.
//

import XCTest
import SwiftUI

@testable import ExpensesBot

final class UIImageResizeTests: XCTestCase {

    func testResized() throws {

        let image = UIImage.createImage()

        XCTAssertEqual(image?.size.width, 300)
        XCTAssertEqual(image?.size.height, 400)

        let resizedImage1 = image?.resized(maxSize: CGSize(width: 40, height: 40))

        XCTAssertEqual(resizedImage1?.size.width, 30)
        XCTAssertEqual(resizedImage1?.size.height, 40)

        let resizedImage2 = image?.resized(maxSize: CGSize(width: 30, height: 30))

        XCTAssertEqual(resizedImage2?.size.width, 23)
        XCTAssertEqual(resizedImage2?.size.height, 30)

        let resizedImage3 = image?.resized(maxSize: CGSize(width: 30, height: 40))

        XCTAssertEqual(resizedImage3?.size.width, 30)
        XCTAssertEqual(resizedImage3?.size.height, 40)
    }
}
