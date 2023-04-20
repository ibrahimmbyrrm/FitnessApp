//
//  UILabel+AsyncText.swift
//  FitnessApp
//
//  Created by İbrahim Bayram on 20.04.2023.
//

import Foundation
import UIKit

extension UILabel {
    func changeTextAsync(text : String) {
        DispatchQueue.main.async {
            self.text = text
        }
    }
}
