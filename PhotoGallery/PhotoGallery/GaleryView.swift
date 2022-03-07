//
//  ContentView.swift
//  PhotoGallery
//
//  Created by Igor Chernyshov on 06.03.2022.
//

import SwiftUI

struct GaleryView: View {

	@State private var isShowingImagePicker = false

	@State private var galeryPhotos = [Photo]()
	@State private var newPhoto: Photo?

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
				Button("Add photo") {
					isShowingImagePicker = true
				}
			}
			.navigationTitle("Photo Galery")
			.sheet(isPresented: $isShowingImagePicker, onDismiss: {
				if let newPhoto = newPhoto { galeryPhotos.append(newPhoto) }
			}) {
				ImagePicker(photo: $newPhoto)
			}
		}
    }
}

struct GaleryView_Previews: PreviewProvider {
    static var previews: some View {
        GaleryView()
    }
}
