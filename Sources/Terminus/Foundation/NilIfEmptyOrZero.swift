//
//  NilIfEmptyOrZero.swift
//  
//
//  Created by Ross Kimes on 12/5/22.
//

import Foundation

public extension Numeric {
	
	var nilIfZero: Self? {
		self == .zero ? nil : self
	}
}

public extension Collection {
	
	var nilIfEmpty: Self? {
		isEmpty ? nil : self
	}
}
