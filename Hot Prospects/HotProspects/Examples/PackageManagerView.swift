//
//  PackageManagerView.swift
//  HotProspects
//
//  Created by Igor Chernyshov on 10.03.2022.
//

import SamplePackage
import SwiftUI

struct PackageManagerView: View {

	let possibleNumbers = Array(1...60)
	var results: String {
		let selected = possibleNumbers.random(7).sorted()
		let strings = selected.map(String.init)
		return strings.joined(separator: ", ")
	}

    var body: some View {
		Text(results)
    }
}

struct PackageManagerView_Previews: PreviewProvider {
    static var previews: some View {
        PackageManagerView()
    }
}
