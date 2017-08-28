//
//  RGProgressHUD+Internal.swift
//  RGProgressHUD
//
//  Created by Ritesh Gupta on 07/08/17.
//  Copyright © 2017 Ritesh. All rights reserved.
//

import Foundation
import UIKit

extension RGProgressHUD {

	func prepareSubviews(for parentView: UIView) {
		guard _progressView == nil else {
			return
		}
		_progressView = progressView(for: parentView)
		_progressView.alpha = 0.0
		parentView.addSubview(_progressView)
	}

	func progressView(for parentView: UIView) -> UIView {
		switch mode {
		case .normal(let appearance):
			return progressView(for: parentView, with: appearance)
		case .blur(let appearance):
			return progressView(for: parentView, with: appearance)
		case .custom(let customView):
			return customView
		}
	}

	func overlayView(for parentView: UIView) -> UIView {
		switch mode {
		case .normal(let appearance):
			let overlay = UIView(frame: parentView.frame)
			overlay.backgroundColor = appearance.overlayColor
			return overlay
		case .blur(let appearance):
			let overlay = UIVisualEffectView(frame: parentView.frame)
			overlay.effect = UIBlurEffect(style: appearance.blurEffectStyle)
			overlay.tintColor = appearance.overlayColor
			return overlay
		case .custom:
			return UIView()
		}
	}

	func containerView(for parentView: UIView) -> UIView {
		let containerView = UIView(frame: parentView.frame)
		containerView.backgroundColor = .clear
		return containerView
	}

	func progressView(for parentView: UIView, with appearance: RGProgressHUDAppearance) -> UIView {
		let _containerView = containerView(for: parentView)
		let _overlay = overlayView(for: parentView)
		_indicatorView = indicatorView(for: parentView, with: appearance)
		_indicatorView.center = parentView.center
		_indicatorView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
		_containerView.addSubview(_overlay)
		_containerView.addSubview(_indicatorView)
		return _containerView
	}

	func indicatorView(for parentView: UIView, with appearance: RGProgressHUDAppearance) -> UIView {
		let activityIndicatorContainerView = UIView(frame: CGRect(x: 0, y: 0, width: 80.0, height: 80.0))
		activityIndicatorContainerView.layer.cornerRadius = 4.0
		activityIndicatorContainerView.backgroundColor = appearance.indicatorBackgroundColor
		let indicatorView = activityIndicatorView(with: appearance)
		indicatorView.frame = activityIndicatorContainerView.frame
		activityIndicatorContainerView.addSubview(indicatorView)
		return activityIndicatorContainerView
	}

	func activityIndicatorView(with appearance: RGProgressHUDAppearance) -> UIActivityIndicatorView {
		let indicatorView = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
		indicatorView.color = appearance.indicatorColor
		indicatorView.startAnimating()
		return indicatorView
	}
}
