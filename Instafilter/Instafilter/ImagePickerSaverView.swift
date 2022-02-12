//
//  ImagePickerSaverView.swift
//  Instafilter
//
//  Created by Igor Chernyshov on 12.02.2022.
//

import SwiftUI

struct ImagePickerSaverView: View {

	@State private var image: Image?
	@State private var inputImage: UIImage?
	@State private var showingImagePicker = false

	var body: some View {
		VStack {
			image?
				.resizable()
				.scaledToFit()

			Button("Select Image") {
				showingImagePicker = true
			}

			Button("Save Image") {
				guard let inputImage = inputImage else { return }
				ImageSaver().writeToPhotoAlbum(image: inputImage)
			}
		}
		.sheet(isPresented: $showingImagePicker) {
			ImagePicker(image: $inputImage)
		}
		.onChange(of: inputImage) { _ in loadImage() }
	}

	private func loadImage() {
		guard let inputImage = inputImage else { return }
		image = Image(uiImage: inputImage)
		UIImageWriteToSavedPhotosAlbum(inputImage, nil, nil, nil)
	}
}

struct ImagePickerSaverView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePickerSaverView()
    }
}
