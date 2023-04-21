//
//  String+asImage.swift
//  FitnessApp
//
//  Created by İbrahim Bayram on 22.04.2023.
//
import UIKit
import Foundation

extension String {
    func asImage() -> UIImage {
        return UIImage(named: self)!
    }
}
