//
//  RGProgressHUDProvider+Reactive.swift
//  RGProgressHUD
//
//  Created by Ritesh Gupta on 28/08/17.
//  Copyright © 2017 Ritesh. All rights reserved.
//

import Foundation
import UIKit
import ReactiveSwift
import ReactiveCocoa

public extension Reactive where Base: UIViewController, Base: RGProgressHUDProvider {
    
    public var shouldShowLoader: BindingTarget<Bool> {
        return makeBindingTarget { (controller, show) in
            if show {
                controller.hud.show(on: controller.presentingView)
            } else {
                controller.hud.hide()
            }
        }
    }
}

public extension Reactive where Base: UIView, Base: RGProgressHUDProvider {
    
    public var shouldShowLoader: BindingTarget<Bool> {
        return makeBindingTarget { (view, show) in
            if show {
                view.hud.show(on: view.presentingView)
            } else {
                view.hud.hide()
            }
        }
    }
}
