//
//  ContentView.swift
//  WordScramble
//
//  Created by Igor Chernyshov on 06.01.2022.
//

import SwiftUI

struct ContentView: View {

	// MARK: - States
	@State private var usedWords = [String]()
	@State private var rootWord = ""
	@State private var newWord = ""

	@State private var errorTitle = ""
	@State private var errorMessage = ""
	@State private var showingError = false

	// MARK: - UI
	var body: some View {
		NavigationView {
			List {
				Section {
					TextField("Enter your word", text: $newWord)
						.disableAutocorrection(true)
						.textInputAutocapitalization(.never)
				}

				Section {
					ForEach(usedWords, id: \.self) { word in
						HStack {
							Image(systemName: "\(word.count).circle")
							Text(word)
						}
					}
				}
			}
			.navigationTitle(rootWord)
		}
		.onSubmit(addNewWord)
		.onAppear(perform: startGame)
		.alert(errorTitle, isPresented: $showingError) {
			Button("OK", role: .cancel) { }
		} message: {
			Text(errorMessage)
		}
	}

	private func showWordError(title: String, message: String) {
		errorTitle = title
		errorMessage = message
		showingError = true
	}

	// MARK: - Game Progress
	private func startGame() {
		guard let startWordsURL = Bundle.main.url(forResource: "words", withExtension: "txt"),
			  let startWords = try? String(contentsOf: startWordsURL) else {
				  fatalError("Could not load words.txt from bundle.")
			  }
		let allWords = startWords.components(separatedBy: "\n")
		rootWord = allWords.randomElement() ?? "silkworm"
	}

	private func addNewWord() {
		let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
		guard answer.count > 0 else { return }
		
		guard isOriginal(word: answer) else {
			showWordError(title: "Word used already", message: "Be more original")
			return
		}

		guard isPossible(word: answer) else {
			showWordError(title: "Word not possible", message: "You can't spell that word from '\(rootWord)'!")
			return
		}

		guard isReal(word: answer) else {
			showWordError(title: "Word not recognized", message: "You can't just make them up, you know!")
			return
		}

		withAnimation {
			usedWords.insert(answer, at: 0)
		}
		newWord = ""
	}

	// MARK: - Words checks
	private func isOriginal(word: String) -> Bool {
		!usedWords.contains(word)
	}

	private func isPossible(word: String) -> Bool {
		var tempWord = rootWord
		for letter in word {
			guard let position = tempWord.firstIndex(of: letter) else { return false }
			tempWord.remove(at: position)
		}
		return true
	}

	private func isReal(word: String) -> Bool {
		let checker = UITextChecker()
		let range = NSRange(location: 0, length: word.utf16.count)
		let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")

		return misspelledRange.location == NSNotFound
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
