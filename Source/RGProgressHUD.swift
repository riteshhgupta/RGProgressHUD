//
//  RGProgressHUD.swift
//  RGProgressHUD
//
//  Created by Ritesh Gupta on 06/08/17.
//  Copyright © 2017 Ritesh. All rights reserved.
//

import Foundation
import UIKit

public class RGProgressHUD {

	public static let shared = RGProgressHUD()
	public var mode: RGProgressHUDMode = .normal(RGProgressHUDAppearance())

	var _indicatorView: UIView!
	var _progressView: UIView!
	var isLoading = false

	public func show(on parentView: UIView) {
		guard !isLoading else { return }
		isLoading = true
		prepareSubviews(for: parentView)
		UIView.animate(withDuration: 0.2) {
			self._progressView.alpha = 1.0
			self._indicatorView?.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
		}
	}

	public func show() {
		guard let window = UIApplication.shared.keyWindow else {
			print("RGPRogressHUD not configured, Window not found")
			return
		}
		show(on: window)
	}

	public func hide() {
		guard _progressView != nil, _indicatorView != nil, isLoading else {
			return
		}
		isLoading = false
		UIView.animate(withDuration: 0.2, animations: {
			self._progressView.alpha = 0.0
			self._indicatorView?.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
		}) { _ in
			self._progressView?.removeFromSuperview()
			self._indicatorView = nil
			self._progressView = nil
		}
	}
}
