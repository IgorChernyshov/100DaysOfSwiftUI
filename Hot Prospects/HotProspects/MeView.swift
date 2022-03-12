//
//  MeView.swift
//  HotProspects
//
//  Created by Igor Chernyshov on 11.03.2022.
//

import CoreImage.CIFilterBuiltins
import SwiftUI

struct MeView: View {

	@State private var name = "Anonymous"
	@State private var emailAddress = "you@yoursite.com"
	@State private var qrCode = UIImage()

    var body: some View {
		NavigationView {
			Form {
				TextField("Name", text: $name)
					.textContentType(.name)
					.font(.title)

				TextField("Email address", text: $emailAddress)
					.textContentType(.emailAddress)
					.font(.title)

				Image(uiImage: qrCode)
					.interpolation(.none)
					.resizable()
					.scaledToFit()
					.frame(width: 200, height: 200)
					.contextMenu {
						Button {
							ImageSaver().writeToPhotoAlbum(image: qrCode)
						} label: {
							Label("Save to Photos", systemImage: "square.and.arrow.down")
						}
					}
			}
			.navigationTitle("Your code")
			.onAppear(perform: updateCode)
			.onChange(of: name) { _ in updateCode() }
			.onChange(of: emailAddress) { _ in updateCode() }
		}
    }

	private func generateQRCode(from string: String) -> UIImage {
		let filter = CIFilter.qrCodeGenerator()
		filter.message = Data(string.utf8)

		if let outputImage = filter.outputImage {
			if let cgimg = CIContext().createCGImage(outputImage, from: outputImage.extent) {
				return UIImage(cgImage: cgimg)
			}
		}

		return UIImage(systemName: "xmark.circle") ?? UIImage()
	}

	private func updateCode() {
		qrCode = generateQRCode(from: "\(name)\n\(emailAddress)")
	}
}

struct MeView_Previews: PreviewProvider {
    static var previews: some View {
        MeView()
    }
}
