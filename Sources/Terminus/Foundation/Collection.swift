//
//  Collection.swift
//  
//
//  Created by Ross Kimes on 12/6/22.
//

import Foundation

public extension Collection {
	
	func at(index: Index) -> Element? {
		indices.contains(index) ? self[index] : nil
	}
}
