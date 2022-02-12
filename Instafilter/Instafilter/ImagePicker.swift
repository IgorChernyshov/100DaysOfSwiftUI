//
//  ImagePicker.swift
//  Instafilter
//
//  Created by Igor Chernyshov on 12.02.2022.
//

import PhotosUI
import SwiftUI

struct ImagePicker {
	@Binding var image: UIImage?
}

extension ImagePicker: UIViewControllerRepresentable {

	typealias UIViewControllerType = PHPickerViewController

	func makeUIViewController(context: Context) -> PHPickerViewController {
		var config = PHPickerConfiguration()
		config.filter = .images

		let picker = PHPickerViewController(configuration: config)
		picker.delegate = context.coordinator

		return picker
	}

	func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {}

	func makeCoordinator() -> Coordinator { Coordinator(self) }
}
