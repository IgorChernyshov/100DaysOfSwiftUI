//
//  FilterType.swift
//  CoreDataProject
//
//  Created by Igor Chernyshov on 05.02.2022.
//

enum FilterType: String, CaseIterable {
	case equal = "=="
	case lessThan = "<"
	case greaterThan = ">"
 	case beginsWith = "BEGINSWITH"
	case beginsWithIgnoreCase = "BEGINSWITH[c]"
	case contains = "CONTAINS"
	case containsIgnoreCase = "CONTAINS[c]"
}
