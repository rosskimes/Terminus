//
//  Sorted.swift
//  
//
//  Created by Ross Kimes on 12/5/22.
//

import Foundation

extension Sequence {
	
	public func sorted(by transform: (Element) -> some Comparable) -> [Element] {
		return sorted {
			transform($0) < transform($1)
		}
	}
	
	public func min(by transform: (Element) -> some Comparable) -> Element? {
		self.min {
			transform($0) < transform($1)
		}
	}
	
	public func max(by transform: (Element) -> some Comparable) -> Element? {
		self.max {
			transform($0) < transform($1)
		}
	}
}
