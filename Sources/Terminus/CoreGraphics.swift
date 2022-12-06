//
//  CoreGraphics.swift
//  
//
//  Created by Ross Kimes on 12/5/22.
//

import Foundation
import CoreGraphics
import SwiftUI

extension CGPoint {
	
	
	/// Creates a point around a circle at a specified angle.
	/// - Parameters:
	///   - center: The center of the circle.
	///   - radius: The radius of the circle.
	///   - angle: The angle of the point around the circle.
	public init(center: CGPoint, radius: Double, angle: Measurement<UnitAngle>) {
		self.init(
			x: center.x + radius * cos(angle.converted(to: .radians).value),
			y: center.y + radius * sin(angle.converted(to: .radians).value)
		)
	}
	
	/// Creates a point around a circle at a specified angle.
	/// - Parameters:
	///   - center: The center of the circle.
	///   - radius: The radius of the circle.
	///   - angle: The angle of the point around the circle.
	public init(center: CGPoint, radius: Double, angle: Angle) {
		self.init(
			x: center.x + radius * cos(angle.radians),
			y: center.y + radius * sin(angle.radians)
		)
	}
}

extension CGSize {
	
	/// The center point of a CGRect at the specified size.
	public var center: CGPoint {
		CGPoint(x: width/2, y: height/2)
	}
	
	
	/// The radius of the largest circle that could be contained in a rect with the specificed size.
	public var radius: Double {
		min(width, height) / 2
	}
}

extension CGRect {
	
	
	/// Creates a square rect that holds a circle with the input radius centered at the point provided.
	/// - Parameters:
	///   - center: The center of the circle.
	///   - radius: The radius of the around the center.
	public init(center: CGPoint, radius: Double) {
		self.init(
			x: center.x - radius,
			y: center.y - radius,
			width: radius*2,
			height: radius*2
		)
	}
	
	
	/// Creates a rect with a zero origin with the specificed size.
	/// - Parameter size: The size of the rect.
	public init(size: CGSize) {
		self.init(origin: .zero, size: size)
	}
}
