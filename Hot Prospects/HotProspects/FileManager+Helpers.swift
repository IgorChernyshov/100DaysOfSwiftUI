//
//  FileManager+Helpers.swift
//  HotProspects
//
//  Created by Igor Chernyshov on 15.03.2022.
//

import Foundation

extension FileManager {
	static func documentsDirectory() -> URL {
		FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
	}
}
