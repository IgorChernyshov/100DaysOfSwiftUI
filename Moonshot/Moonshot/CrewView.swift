//
//  CrewView.swift
//  Moonshot
//
//  Created by Igor Chernyshov on 22.01.2022.
//

import SwiftUI

struct CrewView: View {

	let crew: [CrewMember]

    var body: some View {
		ScrollView(.horizontal, showsIndicators: false) {
			HStack {
				ForEach(crew, id: \.role) { crewMember in
					NavigationLink {
						AstronautView(astronaut: crewMember.astronaut)
					} label: {
						HStack {
							Image(crewMember.astronaut.id)
								.resizable()
								.frame(width: 104, height: 72)
								.clipShape(Capsule())
								.overlay(
									Capsule()
										.strokeBorder(.white, lineWidth: 1)
								)

							VStack(alignment: .leading) {
								Text(crewMember.astronaut.name)
									.foregroundColor(.white)
									.font(.headline)
								Text(crewMember.role)
									.foregroundColor(.secondary)
							}
						}
						.padding(.horizontal)
					}
				}
			}
		}
    }
}

struct CrewView_Previews: PreviewProvider {

	static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")

    static var previews: some View {
		let astronaut = astronauts["white"]
		CrewView(crew: [CrewMember(role: "Cpt", astronaut: astronaut!)])
			.preferredColorScheme(.dark)
    }
}
