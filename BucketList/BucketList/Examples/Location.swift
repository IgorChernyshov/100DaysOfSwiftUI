//
//  Location.swift
//  BucketList
//
//  Created by Igor Chernyshov on 26.02.2022.
//

import MapKit

struct Location: Identifiable {
	let id = UUID()
	let name: String
	let coordinate: CLLocationCoordinate2D
}
