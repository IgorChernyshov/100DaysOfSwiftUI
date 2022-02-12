//
//  CIImageExamplesView.swift
//  Instafilter
//
//  Created by Igor Chernyshov on 06.02.2022.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct CIImageExamplesView: View {

	@State private var image: Image?

	var body: some View {
		VStack {
			image?
				.resizable()
				.scaledToFit()
		}
		.onAppear(perform: loadImage)
	}

	func loadImage() {
		guard let inputImage = UIImage(named: "Example") else { return }
		let beginImage = CIImage(image: inputImage)

		let currentFilter = CIFilter.twirlDistortion()
		currentFilter.inputImage = beginImage

		let amount = 1.0

		let inputKeys = currentFilter.inputKeys

		if inputKeys.contains(kCIInputIntensityKey) { currentFilter.setValue(amount, forKey: kCIInputIntensityKey) }
		if inputKeys.contains(kCIInputRadiusKey) { currentFilter.setValue(amount * 200, forKey: kCIInputRadiusKey) }
		if inputKeys.contains(kCIInputScaleKey) { currentFilter.setValue(amount * 10, forKey: kCIInputScaleKey) }

		guard let outputImage = currentFilter.outputImage,
			  let cgImg = CIContext().createCGImage(outputImage, from: outputImage.extent)
		else { return }

		let uiImage = UIImage(cgImage: cgImg)
		image = Image(uiImage: uiImage)
	}
}

struct CIImageExamplesView_Previews: PreviewProvider {
	static var previews: some View {
		CIImageExamplesView()
	}
}
