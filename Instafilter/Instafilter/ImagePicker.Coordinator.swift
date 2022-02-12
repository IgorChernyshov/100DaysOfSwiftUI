//
//  ImagePicker.Coordinator.swift
//  Instafilter
//
//  Created by Igor Chernyshov on 12.02.2022.
//

import PhotosUI

extension ImagePicker {

	final class Coordinator: NSObject {

		var parent: ImagePicker

		init(_ parent: ImagePicker) {
			self.parent = parent
		}
	}
}

extension ImagePicker.Coordinator: PHPickerViewControllerDelegate {

	func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
		picker.dismiss(animated: true)

		guard let provider = results.first?.itemProvider else { return }

		if provider.canLoadObject(ofClass: UIImage.self) {
			provider.loadObject(ofClass: UIImage.self) { image, _ in
				self.parent.image = image as? UIImage
			}
		}
	}
}
