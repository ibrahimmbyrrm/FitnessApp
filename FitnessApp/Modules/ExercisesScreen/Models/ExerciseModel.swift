//
//  ExerciseModel.swift
//  FitnessApp
//
//  Created by İbrahim Bayram on 22.04.2023.
//

import Foundation

struct Exercise : Codable {
    let name : String
    let type : String
    let muscle : String
    let equipment : String
    let difficulty : String
    let instructions : String
}
