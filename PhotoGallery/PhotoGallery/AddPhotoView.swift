//
//  AddPhotoView.swift
//  PhotoGallery
//
//  Created by Igor Chernyshov on 08.03.2022.
//

import SwiftUI

struct AddPhotoView: View {

	@State private var image: UIImage?
	@State private var name: String = ""

	@State private var isShowingImagePicker = false
	@State private var isPhotoSaved = false

    var body: some View {
		Group {
			if isPhotoSaved == false {
				VStack {
					if let image = image {
						Image(uiImage: image)
							.resizable()
							.frame(maxWidth: .infinity)
							.scaledToFit()
					} else {
						Button("Select image") {
							isShowingImagePicker = true
						}
						.frame(maxWidth: .infinity, maxHeight: 200)
						.padding()
						.clipShape(RoundedRectangle(cornerRadius: 10))
						.overlay(
							RoundedRectangle(cornerRadius: 10)
								.stroke(.secondary)
						)
						.padding()
					}

					TextField("Photo name", text: $name)
						.padding()
						.clipShape(RoundedRectangle(cornerRadius: 10))
						.overlay(
							RoundedRectangle(cornerRadius: 10)
								.stroke(.secondary)
						)
						.padding()

					Spacer()

					Button("Save") {
						do {
							try savePhoto()
							isPhotoSaved = true
						} catch {
							print("Photo was not saved. Error: \(error.localizedDescription)")
						}
					}
				}
			} else {
				Text("Photo was saved!")
			}
		}
		.navigationTitle("New Photo")
		.sheet(isPresented: $isShowingImagePicker) {
			ImagePicker(image: $image)
		}
    }

	private func savePhoto() throws {
		guard let image = image else { return }

		let data = try Data(contentsOf: FileManager.savedPhotosPath)
		var galeryPhotos = try JSONDecoder().decode([Photo].self, from: data)
		let photo = Photo(name: name, photo: image)
		galeryPhotos.append(photo)

		let photoData = try JSONEncoder().encode(galeryPhotos)
		try photoData.write(to: FileManager.savedPhotosPath)
	}
}

struct AddPhotoView_Previews: PreviewProvider {
    static var previews: some View {
		NavigationView {
			AddPhotoView()
		}
    }
}
