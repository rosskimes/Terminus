//
//  UpdateEach.swift
//  
//
//  Created by Ross Kimes on 12/5/22.
//

import Foundation

extension MutableCollection {
	public mutating func updateEach(_ body: (inout Element) throws -> Void) rethrows {
		for index in indices {
			try body(&self[index])
		}
	}
}
