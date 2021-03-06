//
//  NetworkLoadView.swift
//  CupcakeCorner
//
//  Created by Igor Chernyshov on 26.01.2022.
//

import SwiftUI

struct NetworkLoadView: View {

	@State private var results = [Result]()

	var body: some View {
//		AsyncImage(url: URL(string: "https://hws.dev/img/logo.png"), scale: 3)

		AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { image in
			image
				.resizable()
				.scaledToFit()
		} placeholder: {
			Color.red
		}
		.frame(width: 200, height: 200)

//		AsyncImage(url: URL(string: "https://hws.dev/img/bad.png")) { phase in
//			if let image = phase.image {
//				image
//					.resizable()
//					.scaledToFit()
//			} else if phase.error != nil {
//				Text("There was an error loading the image.")
//			} else {
//				ProgressView()
//			}
//		}
//		.frame(width: 200, height: 200)

		List(results, id: \.trackId) { item in
			VStack(alignment: .leading) {
				Text(item.trackName)
					.font(.headline)
				Text(item.collectionName)
			}
		}
		.task {
			await loadData()
		}
	}

	private func loadData() async {
		guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
			print("Invalid URL")
			return
		}
		do {
			let (data, _) = try await URLSession.shared.data(from: url)

			if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
				results = decodedResponse.results
			}
		} catch {
			print("Invalid data")
		}
	}
}

struct NetworkLoadView_Previews: PreviewProvider {
    static var previews: some View {
        NetworkLoadView()
    }
}
