//
//  ViewController.swift
//  RGProgressHUD
//
//  Created by Ritesh Gupta on 06/08/17.
//  Copyright © 2017 Ritesh. All rights reserved.
//

import UIKit
import ReactiveSwift
import ReactiveCocoa

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		fakeAPICall = MutableProperty(true)
	}

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		reactive.shouldShowLoader <~ fakeAPICall.producer
	}


	// testing variables

	let fakeASynchronousJobInterval =  4.0

	var fakeAPICall: MutableProperty<Bool>! {
		didSet {
			DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + fakeASynchronousJobInterval) {
				self.fakeAPICall.value = false
			}
		}
	}

	lazy var customLoader: RGProgressHUD = {
		let appearance = RGProgressHUDAppearance()
		appearance.indicatorColor = .yellow
		appearance.indicatorBackgroundColor = UIColor.red.withAlphaComponent(0.75)
		let mode = RGProgressHUDMode.normal(appearance)
		let hud = RGProgressHUD.shared
		hud.mode = mode
		return hud
	}()
}

extension ViewController: RGProgressHUDProvider {

	// you can implement `hud` requirement though we also have a default value to it..
	// ..so you can opt to leave it
	/*
	var hud: RGProgressHUD {
		return customLoader
	}
	*/
}
