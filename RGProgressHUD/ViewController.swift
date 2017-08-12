//
//  ViewController.swift
//  RGProgressHUD
//
//  Created by Ritesh Gupta on 06/08/17.
//  Copyright © 2017 Ritesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	let fakeASynchronousJobInterval =  4.0

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		let hud = testBasicHUD()
		hud.show(on: view)
		DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + fakeASynchronousJobInterval) {
			hud.hide()
		}
	}
}

fileprivate extension ViewController {

	func testBasicHUD() -> RGProgressHUD {
		return RGProgressHUD()
	}

	func testNormalHUD() -> RGProgressHUD {
		let appearance = RGProgressHUDAppearance()
		appearance.indicatorColor = .yellow
		appearance.indicatorBackgroundColor = UIColor.red.withAlphaComponent(0.75)
		let mode = RGProgressHUDMode.normal(appearance)
		let hud = RGProgressHUD(mode: mode)
		return hud
	}

	func testBlurHUD() -> RGProgressHUD {
		let appearance = RGProgressHUDAppearance()
		appearance.blurEffectStyle = .dark
		let mode = RGProgressHUDMode.blur(appearance)
		let hud = RGProgressHUD(mode: mode)
		return hud
	}

	func testCustomHUD() -> RGProgressHUD {
		let loader = customLoader
		let mode = RGProgressHUDMode.custom(loader)
		let hud = RGProgressHUD(mode: mode)
		return hud
	}

	var customLoader: UIView {
		let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
		let loader = UIView(frame: frame)
		loader.center = view.center
		loader.backgroundColor = .red
		return loader
	}
}
