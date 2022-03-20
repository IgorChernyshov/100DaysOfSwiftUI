//
//  FileManager+Helpers.swift
//  Flashzilla
//
//  Created by Igor Chernyshov on 20.03.2022.
//

import Foundation

extension FileManager {
	static func documentsDirectory() -> URL {
		FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
	}
}
