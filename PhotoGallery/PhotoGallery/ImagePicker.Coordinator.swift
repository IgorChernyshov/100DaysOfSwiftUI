//
//  ImagePicker.Coordinator.swift
//  PhotoGallery
//
//  Created by Igor Chernyshov on 06.03.2022.
//

import PhotosUI

extension ImagePicker {

	final class Coordinator: NSObject {

		var parent: ImagePicker

		init(parent: ImagePicker) {
			self.parent = parent
		}
	}
}

extension ImagePicker.Coordinator: PHPickerViewControllerDelegate {

	func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
		picker.dismiss(animated: UIView.areAnimationsEnabled)

		guard let provider = results.first?.itemProvider, provider.canLoadObject(ofClass: UIImage.self) else { return }
		provider.loadObject(ofClass: UIImage.self) { image, _ in
			self.parent.image = image as? UIImage
		}
	}
}
