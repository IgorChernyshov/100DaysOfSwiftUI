//
//  MainScreenLayouts.swift
//  Moonshot
//
//  Created by Igor Chernyshov on 22.01.2022.
//

import SwiftUI

struct GridLayout: View {

	private let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
	private let missions: [Mission] = Bundle.main.decode("missions.json")

	private let columns = [GridItem(.adaptive(minimum: 150))]

	var body: some View {
		LazyVGrid(columns: columns) {
			ForEach(missions) { mission in
				NavigationLink {
					MissionView(mission: mission, astronauts: astronauts)
				} label: {
					VStack {
						Image(mission.image)
							.resizable()
							.scaledToFit()
							.frame(width: 100, height: 100)
							.padding()

						VStack {
							Text(mission.displayName)
								.font(.headline)
								.foregroundColor(.white)
							Text(mission.formattedLaunchDate)
								.font(.caption)
								.foregroundColor(.white.opacity(0.5))
						}
						.padding(.vertical)
						.frame(maxWidth: .infinity)
						.background(.lightBackground)
					}
					.clipShape(RoundedRectangle(cornerRadius: 10))
					.overlay(
						RoundedRectangle(cornerRadius: 10)
							.stroke(.lightBackground)
					)
				}
			}
		}
		.padding([.horizontal, .bottom])
	}
}

struct ListLayout: View {

	private let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
	private let missions: [Mission] = Bundle.main.decode("missions.json")

	var body: some View {
		VStack {
			ForEach(missions) { mission in
				NavigationLink {
					MissionView(mission: mission, astronauts: astronauts)
				} label: {
					VStack {
						Image(mission.image)
							.resizable()
							.scaledToFit()
							.frame(width: 100, height: 100)
							.padding()

						VStack {
							Text(mission.displayName)
								.font(.headline)
								.foregroundColor(.white)
							Text(mission.formattedLaunchDate)
								.font(.caption)
								.foregroundColor(.white.opacity(0.5))
						}
						.padding(.vertical)
						.frame(maxWidth: .infinity)
						.background(.lightBackground)
					}
					.clipShape(RoundedRectangle(cornerRadius: 10))
					.overlay(
						RoundedRectangle(cornerRadius: 10)
							.stroke(.lightBackground)
					)
				}
			}
		}
	}
}

struct MainScreenLayouts_Previews: PreviewProvider {
	static var previews: some View {
		GridLayout()
			.preferredColorScheme(.dark)
		ListLayout()
			.preferredColorScheme(.dark)
	}
}
