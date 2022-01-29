//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Igor Chernyshov on 26.01.2022.
//

import SwiftUI

struct AddressView: View {

	@ObservedObject var orderWrapper: OrderClassWrapper

	var body: some View {
		Form {
			Section {
				TextField("Name", text: $orderWrapper.order.name)
				TextField("Street Address", text: $orderWrapper.order.streetAddress)
				TextField("City", text: $orderWrapper.order.city)
				TextField("Zip", text: $orderWrapper.order.zip)
			}

			Section {
				NavigationLink {
					CheckoutView(orderWrapper: orderWrapper)
				} label: {
					Text("Check out")
				}
			}
			.disabled(orderWrapper.order.hasValidAddress == false)
		}
		.navigationTitle("Delivery details")
		.navigationBarTitleDisplayMode(.inline)
	}
}

struct AddressView_Previews: PreviewProvider {
	static var previews: some View {
		AddressView(orderWrapper: OrderClassWrapper())
	}
}
