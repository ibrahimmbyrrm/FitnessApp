//
//  HealthKitElement.swift
//  FitnessApp
//
//  Created by İbrahim Bayram on 20.04.2023.
//

import Foundation
import HealthKit

protocol HealthElement {
    var type : HKQuantityTypeIdentifier {get}
    var unit : HKUnit {get}
}

struct WaterElement : HealthElement {
    var type : HKQuantityTypeIdentifier {
        return .dietaryWater
    }
    var unit : HKUnit {
        return HKUnit.literUnit(with: .milli)
    }
}

struct StepElement : HealthElement {
    var type : HKQuantityTypeIdentifier {
        return .stepCount
    }
    var unit : HKUnit {
        return HKUnit.count()
    }
}
