//
//  NetworkHelper.swift
//  FitnessApp
//
//  Created by İbrahim Bayram on 22.04.2023.
//

import Foundation
import UIKit

enum HTTPMethod : String {
    case get = "GET"
    case post = "POST"
}

enum HTTPError : String,Error {
    case invalidURL = "Invalid URL"
    case invalidData = "Invalid Data"
    case parsingError = "Parsing Error"
}

enum BaseURLS : String {
    case exerciseURL = "https://api.api-ninjas.com/v1/exercises"
    case nutritionURL = "https://api.api-ninjas.com/v1/nutrition?query"
}

struct NetworkHelper {
    static let shared = NetworkHelper()
    
    let headers = ["X-Api-Key" : "\(ProcessInfo.processInfo.environment["API_KEY"]!)"]
}
