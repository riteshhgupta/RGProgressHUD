//
//  RGProgressHUDMode.swift
//  RGProgressHUD
//
//  Created by Ritesh Gupta on 07/08/17.
//  Copyright © 2017 Ritesh. All rights reserved.
//

import Foundation
import UIKit

public enum RGProgressHUDMode {

	case normal(RGProgressHUDAppearance)
	case blur(RGProgressHUDAppearance)
	case custom(UIView)
}
