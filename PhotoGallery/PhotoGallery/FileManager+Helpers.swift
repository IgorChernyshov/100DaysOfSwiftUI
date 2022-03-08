//
//  FileManager+Helpers.swift
//  PhotoGallery
//
//  Created by Igor Chernyshov on 08.03.2022.
//

import Foundation

extension FileManager {
	static var savedPhotosPath: URL {
		FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("SavedPhotos")
	}
}
