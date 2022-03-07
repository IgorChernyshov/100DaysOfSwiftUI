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
