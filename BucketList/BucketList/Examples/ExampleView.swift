//
//  ExampleView.swift
//  BucketList
//
//  Created by Igor Chernyshov on 26.02.2022.
//

import SwiftUI

struct ExampleView: View {

	@State private var loadingState = LoadingState.loading

	var body: some View {
		Group {
			if loadingState == .loading {
				LoadingView()
			} else if loadingState == .success {
				SuccessView()
			} else if loadingState == .failed {
				FailedView()
			}
		}
		.onTapGesture {
			let str = "Test Message"
			let url = FileManager.documentsDirectory().appendingPathComponent("message.txt")

			do {
				try str.write(to: url, atomically: true, encoding: .utf8)
				let input = try String(contentsOf: url)
				print(input)
			} catch {
				print(error.localizedDescription)
			}
		}
	}
}

struct ExampleView_Previews: PreviewProvider {
	static var previews: some View {
		ExampleView()
	}
}
