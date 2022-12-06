//
//  UserDefaults+Codable.swift
//  
//
//  Created by Ross Kimes on 12/5/22.
//

import Foundation

public extension UserDefaults {
	
	
	/// Encodes a value and saves it the UserDefaults.
	/// - Parameters:
	///   - value: The Encodable value to store.
	///   - key: The UserDefaults key.
	///   - encoder: The JSONEncoded to use for the encoding.
	func encode<T: Encodable>(_ value: T, forKey key: String, encoder: JSONEncoder = .init()) throws {
		set(try encoder.encode(value), forKey: key)
	}
	
	/// Decodes a value from UserDefaults.
	/// - Parameters:
	///   - key: The UserDefaults key.
	///   - decoder: The JSONDecoder to use for the decoding.
	/// - Returns: The decoded value (if it exists).
	func decode<T: Decodable>(forKey key: String, decoder: JSONDecoder = .init()) -> T? {
		
		data(forKey: key)
			.flatMap {
				try? decoder.decode(T.self, from: $0)
			}
	}
}
