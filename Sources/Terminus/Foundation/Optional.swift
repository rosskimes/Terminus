//
//  Optional.swift
//
//
//  Created by Ross Kimes on 6/23/24.
//

import Foundation

public extension Optional {
	
	enum UnwrapError: Error {
		case noWrappedValue
	}
	
	func unwrap(_ error: @autoclosure () -> Error = UnwrapError.noWrappedValue) throws -> Wrapped {
		guard let value = self else {
			throw error()
		}
		
		return value
	}
}
