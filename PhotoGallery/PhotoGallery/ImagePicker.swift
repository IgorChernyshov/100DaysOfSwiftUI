//
//  ImagePicker.swift
//  PhotoGallery
//
//  Created by Igor Chernyshov on 06.03.2022.
//

import PhotosUI
import SwiftUI

struct ImagePicker {
	@Binding var photo: Photo?
}

extension ImagePicker: UIViewControllerRepresentable {

	typealias UIViewControllerType = PHPickerViewController

	func makeUIViewController(context: Context) -> PHPickerViewController {
		var configuration = PHPickerConfiguration()
		configuration.filter = .images

		let picker = PHPickerViewController(configuration: configuration)
		picker.delegate = context.coordinator

		return picker
	}

	func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {}

	func makeCoordinator() -> Coordinator { Coordinator(parent: self) }
}
