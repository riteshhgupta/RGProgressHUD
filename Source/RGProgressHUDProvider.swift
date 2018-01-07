//
//  RGProgressHUDProvider.swift
//  RGProgressHUD
//
//  Created by Ritesh Gupta on 28/08/17.
//  Copyright © 2017 Ritesh. All rights reserved.
//

import Foundation
import UIKit

public protocol RGProgressHUDProvider {

	var hud: RGProgressHUD { get }
	var presentingView: UIView { get }
}

public extension RGProgressHUDProvider {

	var hud: RGProgressHUD { return .shared }

	func showLoader() { hud.show(on: presentingView) }

	func hideLoader() { hud.hide() }
}

public extension RGProgressHUDProvider where Self: UIViewController {

	var presentingView: UIView { return view }
}

public extension RGProgressHUDProvider where Self: UIView {

	var presentingView: UIView { return self }
}
