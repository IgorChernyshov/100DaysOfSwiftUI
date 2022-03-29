//
//  FileManager+SaveDirectory.swift
//  SnowSeeker
//
//  Created by Igor Chernyshov on 29.03.2022.
//

import Foundation

extension FileManager {
	static var savedFavorites: URL {
		FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("SavedFavorites")
	}
}
