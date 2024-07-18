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

    @State private var viewModel = ViewModel()

    var body: some View {
        HStack {
            if CameraView.isAvailable() {
                Button {
                    self.viewModel.cameraViewIsPresented.toggle()
                } label: {
                    Label("Camera", systemImage: "camera")
                }
                .fullScreenCover(isPresented: self.$viewModel.cameraViewIsPresented) {
                    CameraView(image: self.$image)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                Divider()
            }
            PhotosPicker(selection: self.$viewModel.photosPickerItem, matching: .images) {
                Label("Photo library", systemImage: "photo")
            }
            .onChange(of: self.viewModel.photosPickerItem) {
                Task {
                    self.image = await self.viewModel.photosPickerLoadTransferable()

                    self.isPresented.toggle()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
    }
}
