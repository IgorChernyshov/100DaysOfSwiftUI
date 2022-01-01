//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Igor Chernyshov on 31.12.2021.
//

import SwiftUI

struct ContentView: View {

	@State private var pickedItem = Item.allCases.randomElement()!
	@State private var shouldWin = true
	@State private var score = 0

    var body: some View {
		VStack {
			Text("Score: \(score)")

			Spacer()

			Text("\(pickedItem.rawValue)")
				.font(.system(size: 200))
				.padding()

			Text("Choose an item to \(shouldWin ? "win" : "loose")")

			Spacer()
			HStack(spacing: 40) {
				ForEach(Item.allCases, id: \.rawValue) { item in
					Button(item.rawValue) {
						checkSelected(item: item)
					}
				}
			}
			.font(.system(size: 75))
		}
    }

	private func checkSelected(item: Item) {
		guard ((item > pickedItem) && shouldWin) || ((item < pickedItem) && !shouldWin) else {
			return score -= 1
		}
		score += 1
		shouldWin.toggle()
		pickedItem = Item.allCases.randomElement()!
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
