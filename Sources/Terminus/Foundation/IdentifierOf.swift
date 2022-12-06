//
//  IdentifierOf.swift
//  
//
//  Created by Ross Kimes on 12/5/22.
//

import Foundation

public struct IdentifierOf<T>: Hashable, Codable, Identifiable {
	
	public let id: UUID
	
	public init() {
		id = UUID()
	}
}

extension IdentifierOf: RawRepresentable {
	public init?(rawValue: String) {
		
		guard let uuid = UUID(uuidString: rawValue) else {
			return nil
		}
		
		self.id = uuid
	}
	
	public var rawValue: String {
		id.uuidString
	}
}
