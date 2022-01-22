//
//  MissionView.swift
//  Moonshot
//
//  Created by Igor Chernyshov on 16.01.2022.
//

import SwiftUI

struct MissionView: View {

	private let mission: Mission
	private let crew: [CrewMember]

	init(mission: Mission, astronauts: [String: Astronaut]) {
		self.mission = mission

		self.crew = mission.crew.map { member in
			if let astronaut = astronauts[member.name] {
				return CrewMember(role: member.role, astronaut: astronaut)
			} else {
				fatalError("Missing \(member.name)")
			}
		}
	}

	var body: some View {
		GeometryReader { geometry in
			ScrollView {
				VStack {
					Image(mission.image)
						.resizable()
						.scaledToFit()
						.frame(maxWidth: geometry.size.width * 0.6)
						.padding(.top)

					Text(mission.formattedLaunchDate)
						.font(.headline)
						.foregroundColor(.white.opacity(0.7))

					VStack(alignment: .leading) {
						Divider()

						Text("Mission Highlights")
							.font(.title.bold())
							.padding(.bottom, 5)

						Text(mission.description)

						Divider()

						Text("Crew")
							.font(.title.bold())
							.padding(.bottom, 5)
					}
					.padding(.horizontal)

					CrewView(crew: crew)
				}
				.padding(.bottom)
			}
		}
		.navigationTitle(mission.displayName)
		.navigationBarTitleDisplayMode(.inline)
		.background(.darkBackground)
	}
}

struct MissionView_Previews: PreviewProvider {

	static let missions: [Mission] = Bundle.main.decode("missions.json")
	static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")

	static var previews: some View {
		MissionView(mission: missions[1], astronauts: astronauts)
			.preferredColorScheme(.dark)
	}
}
