//
//  LoadingState.swift
//  BucketList
//
//  Created by Igor Chernyshov on 26.02.2022.
//

import SwiftUI

enum LoadingState {
	case loading, success, failed
}

struct LoadingView: View {
	var body: some View {
		Text("Loading...")
	}
}

struct SuccessView: View {
	var body: some View {
		Text("Success!")
	}
}

struct FailedView: View {
	var body: some View {
		Text("Failed.")
	}
}
