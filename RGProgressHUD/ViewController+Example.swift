//
//  ViewController+Example.swift
//  RGProgressHUD
//
//  Created by Ritesh Gupta on 28/08/17.
//  Copyright © 2017 Ritesh. All rights reserved.
//

import Foundation
import UIKit

extension ViewController {

	func testBasicHUD() -> RGProgressHUD {
		return RGProgressHUD.shared
	}

	func testNormalHUD() -> RGProgressHUD {
		let appearance = RGProgressHUDAppearance()
		appearance.indicatorColor = .yellow
		appearance.indicatorBackgroundColor = UIColor.red.withAlphaComponent(0.75)
		let mode = RGProgressHUDMode.normal(appearance)
		let hud = RGProgressHUD.shared
		hud.mode = mode
		return hud
	}

	func testBlurHUD() -> RGProgressHUD {
		let appearance = RGProgressHUDAppearance()
		appearance.blurEffectStyle = .dark
		let mode = RGProgressHUDMode.blur(appearance)
		let hud = RGProgressHUD.shared
		hud.mode = mode
		return hud
	}

	func testCustomHUD() -> RGProgressHUD {
		let loader = customLoaderView
		let mode = RGProgressHUDMode.custom(loader)
		let hud = RGProgressHUD.shared
		hud.mode = mode
		return hud
	}

	var customLoaderView: UIView {
		let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
		let loader = UIView(frame: frame)
		loader.center = view.center
		loader.backgroundColor = .red
		return loader
	}
}
