//
//  OrderClassWrapper.swift
//  CupcakeCorner
//
//  Created by Igor Chernyshov on 29.01.2022.
//

import SwiftUI

final class OrderClassWrapper: ObservableObject {
	@Published var order = Order()
}
