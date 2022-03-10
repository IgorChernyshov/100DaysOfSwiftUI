//
//  ResultsExampleView.swift
//  HotProspects
//
//  Created by Igor Chernyshov on 09.03.2022.
//

import SwiftUI

struct ResultsExampleView: View {

	@State private var output = ""

	var body: some View {
		Text(output)
			.task {
				await fetchReadings()
			}
	}

	func fetchReadings() async {
		let fetchTask = Task { () -> String in
			let url = URL(string: "https://hws.dev/readings.json")!
			let (data, _) = try await URLSession.shared.data(from: url)
			let readings = try JSONDecoder().decode([Double].self, from: data)
			return "Found \(readings.count) readings"
		}
		let result = await fetchTask.result

		switch result {
			case .success(let string):
				output = string
			case .failure(let error):
				output = "Error: \(error.localizedDescription)"
		}
	}
}

struct ResultsExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsExampleView()
    }
}
