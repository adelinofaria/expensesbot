//
//  UIImage+Color.swift
//  ExpensesBotTests
//
//  Created by Adelino Faria on 18/07/2024.
//

import SwiftUI

extension UIImage {

    static func createImage(size: CGSize = CGSize(width: 300, height: 400)) -> UIImage? {

        let rect = CGRect(origin: .zero, size: size)

        UIGraphicsBeginImageContextWithOptions(rect.size, false, 1.0)
        UIColor.red.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        if let cgImage = image?.cgImage {
            return .init(cgImage: cgImage)
        } else {
            return nil
        }
    }
}
