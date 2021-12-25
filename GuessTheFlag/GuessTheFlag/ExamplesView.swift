//
//  ExamplesView.swift
//  GuessTheFlag
//
//  Created by Igor Chernyshov on 25.12.2021.
//

import SwiftUI

struct ExamplesView: View {

	@State private var isShowingAlert = false
	
    var body: some View {
		ZStack {
			VStack(spacing: 0) {
				RadialGradient(gradient: Gradient(colors: [.blue, .black]), center: .center, startRadius: 20, endRadius: 200)
				AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)
				LinearGradient(gradient: Gradient(stops: [
					.init(color: .white, location: 0.2),
					.init(color: .black, location: 0.8)
				]), startPoint: .top, endPoint: .bottom)
			}
			VStack {
				Text("Your content")
					.foregroundStyle(.secondary)
					.padding(50)
					.background(.ultraThinMaterial)

				VStack {
					Button("Button 1") { }
					.buttonStyle(.bordered)
					Button("Button 2", role: .destructive) { }
					.buttonStyle(.bordered)
					Button("Button 3") { }
					.buttonStyle(.borderedProminent)
					.tint(.mint)
					Button("Button 4", role: .destructive) { }
					.buttonStyle(.borderedProminent)
				}
				.padding()
				.background(.ultraThinMaterial)

				Button {
					isShowingAlert = true
				} label: {
					Text("Show alert")
						.padding()
						.foregroundColor(.white)
						.background(.red)
				}
				.alert("Important message", isPresented: $isShowingAlert) {
					Button("Delete", role: .destructive) { }
					Button("Cancel", role: .cancel) { }
				} message: {
					Text("Please read this.")
				}

				Button {
					print("Edit button was tapped")
				} label: {
					Label("Edit", systemImage: "pencil")
				}
			}
		}
		.ignoresSafeArea()
    }
}

struct ExamplesView_Previews: PreviewProvider {
    static var previews: some View {
        ExamplesView()
    }
}
