//
//  ImageSourcePickerView.swift
//  ExpensesBot
//
//  Created by Adelino Faria on 16/07/2024.
//

import SwiftUI
import PhotosUI

struct ImageSourcePickerView: View {

    @Binding var selectedImage: UIImage?

    @State private var presentCameraView = false
    @State private var photosPickerItem: PhotosPickerItem?
    @State private var image: UIImage?

    var body: some View {
        HStack {
            if let image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            }
            Button("📸") {
                self.presentCameraView.toggle()
            }
            .fullScreenCover(isPresented: self.$presentCameraView) {
                CameraView(image: self.$image)
            }
            PhotosPicker("🖼️", selection: $photosPickerItem, matching: .images)
            .onChange(of: self.photosPickerItem) {
                Task {
                    if let loaded = try? await self.photosPickerItem?.loadTransferable(type: Image.self) {
                        self.image = ImageRenderer(content: loaded).uiImage
                    }
                }
            }
        }
        .frame(height: 100)
    }
}
