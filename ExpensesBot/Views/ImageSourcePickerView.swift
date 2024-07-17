//
//  ImageSourcePickerView.swift
//  ExpensesBot
//
//  Created by Adelino Faria on 16/07/2024.
//

import SwiftUI
import PhotosUI

struct ImageSourcePickerView: View {

    @Binding var isPresented: Bool
    @Binding var image: UIImage?

    @State private var cameraViewIsPresented = false
    @State private var photosPickerItem: PhotosPickerItem?

    var body: some View {
        HStack {
            Button {
                self.cameraViewIsPresented.toggle()
            } label: {
                Label("Camera", systemImage: "camera")
            }
            .fullScreenCover(isPresented: self.$cameraViewIsPresented) {
                CameraView(image: self.$image)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            Divider()
            PhotosPicker(selection: $photosPickerItem, matching: .images) {
                Label("Photo library", systemImage: "photo")
            }
            .onChange(of: self.photosPickerItem) {
                Task {
                    if let loaded = try? await self.photosPickerItem?.loadTransferable(type: Image.self) {
                        self.image = ImageRenderer(content: loaded).uiImage
                    }

                    self.isPresented.toggle()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
    }
}
