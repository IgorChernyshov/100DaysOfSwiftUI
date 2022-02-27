//
//  ExampleMapView.swift
//  BucketList
//
//  Created by Igor Chernyshov on 26.02.2022.
//

import LocalAuthentication
import MapKit
import SwiftUI

struct ExampleMapView: View {

	@State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.12), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
	@State private var isUnlocked = false

	let locations = [
		ExampleLocation(name: "Buckingham Palace", coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141)),
		ExampleLocation(name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076))
	]

    var body: some View {
		NavigationView {
			VStack {
				if isUnlocked {
					Map(coordinateRegion: $mapRegion, annotationItems: locations) { location in
						MapAnnotation(coordinate: location.coordinate) {
							NavigationLink {
								Text(location.name)
							} label: {
								Circle()
									.stroke(.red, lineWidth: 3)
									.frame(width: 44, height: 44)
							}
						}
					}
				} else {
					Text("Locked")
				}
			}
			.onAppear(perform: authenticate)
			.navigationTitle("London Explorer")
		}
    }

	private func authenticate() {
		let context = LAContext()
		var error: NSError?

		if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
			let reason = "We need to unlock your data."

			context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
				if success {
					isUnlocked = true
				} else {
					// there was a problem
				}
			}
		} else {
			// no biometrics
		}
	}
}

struct ExampleMapView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleMapView()
    }
}
