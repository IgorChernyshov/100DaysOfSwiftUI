//
//  DiceView.swift
//  Dices
//
//  Created by Igor Chernyshov on 26.03.2022.
//

import SwiftUI

struct DiceView: View {

	let rolledNumber: Int

    var body: some View {
		ZStack {
			Rectangle()
				.cornerRadius(20)
				.foregroundColor(.red)
				.shadow(radius: 10)

			DotsView(numberOfDots: rolledNumber, dotSize: 30)
		}
		.frame(width: 200, height: 200)
    }
}

struct DiceView_Previews: PreviewProvider {
    static var previews: some View {
		DiceView(rolledNumber: 5)
    }
}
