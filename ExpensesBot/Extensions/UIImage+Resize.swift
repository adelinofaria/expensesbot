//
//  UIImage+Resize.swift
//  ExpensesBot
//
//  Created by Adelino Faria on 17/07/2024.
//

import UIKit
import AVFoundation

extension UIImage {
    
    /// Resize instance image, maintaining the aspect ratio.
    /// - Parameter maxSize: Max dimentions that the image will obey to, considering aspect size
    /// - Returns: Resized image
    func resized(maxSize: CGSize) -> UIImage {

        let aspectRatioRect = AVFoundation.AVMakeRect(
            aspectRatio: self.size,
            insideRect: .init(origin: .zero, size: maxSize)
        )

        let format = UIGraphicsImageRendererFormat()
        format.scale = 1

        let resizedImage = UIGraphicsImageRenderer(size: aspectRatioRect.size, format: format).image { _ in
            self.draw(in: CGRect(origin: .zero, size: aspectRatioRect.size))
        }

        return resizedImage
    }
}
