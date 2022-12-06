//
//  SwiftUI.swift
//  
//
//  Created by Ross Kimes on 12/5/22.
//

import SwiftUI


/// A convenience struct for creating a custom ButtonStyle with a closure.
public struct CustomButtonStyle<CustomBody: View>: ButtonStyle {
	
	public init(body: @escaping (Configuration) -> CustomBody) {
		self.body = body
	}
	
	public let body: (Configuration) -> CustomBody
	
	public func makeBody(configuration: Configuration) -> CustomBody {
		body(configuration)
	}
}

extension View {
	
	@ViewBuilder public func hidden(if condition: Bool) -> some View {
		if !condition {
			self
		}
	}
}
