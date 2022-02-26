//
//  FileManager+Helpers.swift
//  BucketList
//
//  Created by Igor Chernyshov on 26.02.2022.
//

import Foundation

extension FileManager {
	static func documentsDirectory() -> URL {
		FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
	}
}
