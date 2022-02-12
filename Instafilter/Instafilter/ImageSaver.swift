//
//  ImageSaver.swift
//  Instafilter
//
//  Created by Igor Chernyshov on 16.02.2022.
//

import UIKit

final class ImageSaver: NSObject {
	func writeToPhotoAlbum(image: UIImage) {
		UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveCompleted), nil)
	}

	@objc func saveCompleted(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
		print("Save finished!")
	}
}
