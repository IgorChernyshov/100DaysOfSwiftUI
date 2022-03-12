//
//  ImageSaver.swift
//  HotProspects
//
//  Created by Igor Chernyshov on 12.03.2022.
//

import UIKit

final class ImageSaver: NSObject {

	var successHandler: (() -> Void)?
	var errorHandler: ((Error) -> Void)?

	func writeToPhotoAlbum(image: UIImage) {
		UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveCompleted), nil)
	}

	@objc func saveCompleted(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
		if let error = error {
			errorHandler?(error)
		} else {
			successHandler?()
		}
	}
}
