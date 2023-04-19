//
//  UIView+CornerRadius.swift
//  FitnessApp
//
//  Created by İbrahim Bayram on 19.04.2023.
//

import Foundation
import UIKit

extension UIView {
    @IBInspectable var CornerRadius : CGFloat {
        get {
            return self.CornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable var borderWidth : CGFloat {
        get {
            return self.borderWidth
        }
        set {
            self.layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var bordercolor : CGColor {
        get {
            return self.bordercolor
        }
        set {
            self.layer.borderColor = newValue
        }
    }
}
