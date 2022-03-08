//
//  Photo.swift
//  PhotoGallery
//
//  Created by Igor Chernyshov on 07.03.2022.
//

import UIKit

struct Photo: Identifiable {
	var id = UUID()
	let name: String
	let photo: UIImage
}

extension Photo: Codable {

	enum CodingKeys: CodingKey {
		case id, name, photo
	}

	enum CodingError: Error {
		case decoding
		case encoding
	}

	// MARK: - Codable
	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		id = try container.decode(UUID.self, forKey: .id)
		name = try container.decode(String.self, forKey: .name)
		let photoData = try container.decode(Data.self, forKey: .photo)
		guard let decodedPhoto = UIImage(data: photoData) else { throw CodingError.decoding }
		photo = decodedPhoto
	}

	func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(id, forKey: .id)
		try container.encode(name, forKey: .name)
		guard let photoData = photo.pngData() else { throw CodingError.encoding }
		try container.encode(photoData, forKey: .photo)
	}
}
