//
//  String+asUrl.swift
//  FitnessApp
//
//  Created by İbrahim Bayram on 22.04.2023.
//

import Foundation

extension String {
    func asURL() -> URL {
        return URL(string: self)!
    }
}
