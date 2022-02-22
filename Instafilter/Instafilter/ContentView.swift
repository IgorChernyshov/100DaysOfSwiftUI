//
//  ContentView.swift
//  Instafilter
//
//  Created by Igor Chernyshov on 16.02.2022.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct ContentView: View {

	@State private var image: Image?
	@State private var filterIntensity = 0.5
	@State private var isShowingImagePicker = false

	@State private var inputImage: UIImage?
	@State private var processedImage: UIImage?

	@State private var currentFilter: CIFilter = .sepiaTone()
	@State private var isShowingFilterSheet = false

	private let context = CIContext()

    var body: some View {
		NavigationView {
			VStack {
				ZStack {
					Rectangle()
						.fill(.secondary)

					Text("Tap to select a picture")
						.foregroundColor(.white)
						.font(.headline)

					image?
						.resizable()
						.scaledToFit()
				}
				.onTapGesture {
					isShowingImagePicker = true
				}

				HStack {
					Text("Intensity")

					Slider(value: $filterIntensity)
						.onChange(of: filterIntensity) { _ in
							applyProcessing()
						}
				}
				.padding(.vertical)

				HStack {
					Button("Change Filter") {
						isShowingFilterSheet = true
					}

					Spacer()

					Button("Save", action: save)
				}
			}
			.padding([.horizontal, .bottom])
			.onChange(of: inputImage) { _ in loadImage() }
			.navigationTitle("Instafilter")
			.sheet(isPresented: $isShowingImagePicker) {
				ImagePicker(image: $inputImage)
			}
			.confirmationDialog("Select a filter", isPresented: $isShowingFilterSheet) {
				Button("Crystallize") { setFilter(.crystallize()) }
				Button("Edges") { setFilter(.edges()) }
				Button("Gaussian Blur") { setFilter(.gaussianBlur()) }
				Button("Pixellate") { setFilter(.pixellate()) }
				Button("Sepia Tone") { setFilter(.sepiaTone()) }
				Button("Unsharp Mask") { setFilter(.unsharpMask()) }
				Button("Vignette") { setFilter(.vignette()) }
				Button("Cancel", role: .cancel) { }
			}
		}
    }

	private func save() {
		guard let processedImage = processedImage else { return }

		let imageSaver = ImageSaver()

		imageSaver.successHandler = {
			print("Success!")
		}

		imageSaver.errorHandler = {
			print("Oops: \($0.localizedDescription)")
		}

		imageSaver.writeToPhotoAlbum(image: processedImage)
	}

	private func loadImage() {
		guard let inputImage = inputImage else { return }

		let beginImage = CIImage(image: inputImage)
		currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
		applyProcessing()
	}

	private func applyProcessing() {
		let inputKeys = currentFilter.inputKeys

		if inputKeys.contains(kCIInputIntensityKey) { currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey) }
		if inputKeys.contains(kCIInputRadiusKey) { currentFilter.setValue(filterIntensity * 200, forKey: kCIInputRadiusKey) }
		if inputKeys.contains(kCIInputScaleKey) { currentFilter.setValue(filterIntensity * 10, forKey: kCIInputScaleKey) }

		guard let outputImage = currentFilter.outputImage else { return }

		if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
			let uiImage = UIImage(cgImage: cgimg)
			image = Image(uiImage: uiImage)
			processedImage = uiImage
		}
	}

	private func setFilter(_ filter: CIFilter) {
		currentFilter = filter
		loadImage()
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
