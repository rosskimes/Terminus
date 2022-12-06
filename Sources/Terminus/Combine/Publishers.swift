//
//  Publishers.swift
//  
//
//  Created by Ross Kimes on 12/5/22.
//

import Combine

public extension Publisher {
	
	/// Transforms a Publisher that fails to a Publisher with a Result<Output, Failure> and a new Failure type of `Never`.
	func mapToResult() -> some Publisher<Result<Output, Failure>, Never> {
		self
			.map(Result<Output, Failure>.success)
			.catch { Just(Result<Output, Failure>.failure($0)) }
	}
}
