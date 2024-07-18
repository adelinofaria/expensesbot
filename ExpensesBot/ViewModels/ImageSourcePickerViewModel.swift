//
//  ImageSourcePickerViewModel.swift
//  ExpensesBot
//
//  Created by Adelino Faria on 18/07/2024.
//

import SwiftUI
import PhotosUI

extension ImageSourcePickerView {

    @Observable
    class ViewModel {

        var cameraViewIsPresented = false
        var photosPickerItem: PhotosPickerItem?

        func photosPickerLoadTransferable() async -> UIImage? {

            if let data = try? await self.photosPickerItem?.loadTransferable(type: Data.self) {
                return UIImage(data: data)
            } else {
                return nil
            }
        }
    }
}
