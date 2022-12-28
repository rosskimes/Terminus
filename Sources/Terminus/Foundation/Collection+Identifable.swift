//
//  Collection+Identifable.swift
//  
//
//  Created by Ross Kimes on 12/5/22.
//

import Foundation

extension Collection {
	
	public func first<P: Equatable>(matching: (Element) -> P, to: P) -> Element? {
		first { matching($0) == to }
	}
	
	public func firstIndex<P: Equatable>(matching: (Element) -> P, to: P) -> Index? {
		firstIndex { matching($0) == to }
	}

	
	public func contains<P: Hashable>(matching: (Element) -> P, to: P) -> Bool {
		Set(map(matching)).contains(to)
	}
}

extension Collection where Element: Identifiable {
	
	public func first(matching id: Element.ID?) -> Element? {
		first { $0.id == id }
	}
	
	public func firstIndex(matching id: Element.ID?) -> Index? {
		firstIndex { $0.id == id }
	}
	
	public func contains(matching id: Element.ID?) -> Bool {
		Set(map(\.id)).contains(id)
	}
}

extension Set where Element: Identifiable {
	
	public mutating func update(matching newValue: Element) {
		
		guard let index = firstIndex(matching: newValue.id) else {
			return
		}
		
		remove(at: index)
		insert(newValue)
	}
	
	public mutating func removeAll(matching ids: Set<Element.ID>) {
		ids
			.compactMap(firstIndex(matching:))
			.forEach { remove(at: $0) }
	}
}
