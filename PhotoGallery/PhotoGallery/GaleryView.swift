//
//  ContentView.swift
//  PhotoGallery
//
//  Created by Igor Chernyshov on 06.03.2022.
//

import SwiftUI

struct GaleryView: View {

	@State private var galeryPhotos: [Photo] = []

	init() {
		do {
			let data = try Data(contentsOf: FileManager.savedPhotosPath)
			galeryPhotos = try JSONDecoder().decode([Photo].self, from: data)
		} catch {
			galeryPhotos = []
		}
	}

    var body: some View {
		NavigationView {
			VStack {
				List {
					ForEach(galeryPhotos) { galeryPhoto in
						Image(uiImage: galeryPhoto.photo)
							.resizable()
							.frame(maxWidth: .infinity)
							.scaledToFit()

						Text(galeryPhoto.name)
							.font(.body)
					}
				}
				NavigationLink("Add photo") {
					AddPhotoView()
				}
			}
			.navigationTitle("Photo Galery")
		}
    }
}

struct GaleryView_Previews: PreviewProvider {
    static var previews: some View {
        GaleryView()
    }
}
