//
//  CameraView.swift
//  ExpensesBot
//
//  Created by Adelino Faria on 15/07/2024.
//

import SwiftUI

struct CameraView: UIViewControllerRepresentable {

    @Environment(\.presentationMode) var isPresented

    @Binding var image: UIImage?

    // MARK: Public

    static func isAvailable() -> Bool {
        UIImagePickerController.isSourceTypeAvailable(.camera)
    }

    // MARK: UIViewControllerRepresentable

    typealias UIViewControllerType = UIImagePickerController

    func makeUIViewController(context: Self.Context) -> Self.UIViewControllerType {
        let imagePicker = UIImagePickerController()

        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = false
        imagePicker.delegate = context.coordinator

        return imagePicker
    }

    func updateUIViewController(_ uiViewController: Self.UIViewControllerType, context: Self.Context) {
    }

    typealias Coordinator = CameraViewCoordinator

    func makeCoordinator() -> Self.Coordinator {
        return Coordinator(picker: self)
    }
}

class CameraViewCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    var picker: CameraView

    init(picker: CameraView) {
        self.picker = picker
    }

    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else { return }
        self.picker.image = image
        self.picker.isPresented.wrappedValue.dismiss()
    }
}
