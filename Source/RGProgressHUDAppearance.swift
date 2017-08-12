//
//  RGProgressHUDAppearance.swift
//  RGProgressHUD
//
//  Created by Ritesh Gupta on 07/08/17.
//  Copyright © 2017 Ritesh. All rights reserved.
//

import Foundation
import UIKit

public class RGProgressHUDAppearance {

	public var overlayColor: UIColor
	public var indicatorColor: UIColor
	public var indicatorBackgroundColor: UIColor
	public var blurEffectStyle: UIBlurEffectStyle

	public init(
		overlayColor: UIColor = UIColor.black.withAlphaComponent(0.3),
		indicatorColor: UIColor = .white,
		indicatorBackgroundColor: UIColor = UIColor.black.withAlphaComponent(0.8),
		blurEffectStyle: UIBlurEffectStyle = .dark)
	{
		self.overlayColor = overlayColor
		self.indicatorColor = indicatorColor
		self.indicatorBackgroundColor = indicatorBackgroundColor
		self.blurEffectStyle = blurEffectStyle
	}
}
