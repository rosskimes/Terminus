//
//  Dictionary.swift
//  
//
//  Created by Ross Kimes on 12/5/22.
//

import Foundation

public extension Dictionary {
	
	/// Takes a sequence of `Key` and a closure to turn that `Key` into a an `Value?`.
	/// Every non-nil is initilized into the `Dictionary` with it's corresponding `Key`.
	init<S: Sequence>(
		uniqueKeys keys: S,
		valueFromKey: (Key) -> Value?
	) where S.Element == Key {
		
		let keysAndValues = keys.compactMap { key -> (Key, Value)? in
			guard let value = valueFromKey(key) else { return nil }
			return (key, value)
		}
		
		self.init(uniqueKeysWithValues: keysAndValues)
	}
	
	init<S: Sequence>(
		uniqueKeys keys: S,
		mapKey: (S.Element) -> Key,
		valueFromKey: (S.Element) -> Value?
	) {
		
		let keysAndValues = keys.compactMap { key -> (Key, Value)? in
			guard let value = valueFromKey(key) else { return nil }
			return (mapKey(key), value)
		}
		
		self.init(uniqueKeysWithValues: keysAndValues)
	}
	
	init<S: Sequence>(
		values: S,
		uniqueKeyFromValue: (S.Element) -> Key
	) where S.Element == Value {
		let keysAndValues = values.map { value -> (Key, Value) in
			return (uniqueKeyFromValue(value), value)
		}
		
		self.init(uniqueKeysWithValues: keysAndValues)
	}
}

public extension Sequence where Element: Identifiable {
	
	func keyedById() -> [Element.ID: Element] {
		Dictionary(values: self) { $0.id }
	}
}
