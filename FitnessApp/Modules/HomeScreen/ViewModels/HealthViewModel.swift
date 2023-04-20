//
//  WaterStatusViewModel.swift
//  FitnessApp
//
//  Created by İbrahim Bayram on 20.04.2023.
//

import Foundation
import HealthKit

protocol HealthViewModelOutput {
    var healthService : HealthService {get}
    var viewOutput : HomeViewProtocol? {get}
    func setDelegate(output : HomeViewProtocol)
    func fetchData()
}

class HealthViewModel : HealthViewModelOutput {
    let waterElement = HealthKitElement(type: .dietaryWater, unit: HKUnit.literUnit(with: .milli))
    let stepElement = HealthKitElement(type: .stepCount, unit: .count())
    
    var healthService: HealthService = HealthKitManager()
    var viewOutput: HomeViewProtocol?
    func setDelegate(output: HomeViewProtocol) {
        self.viewOutput = output
    }
    
    func fetchData() {
        healthService.getWater(element: waterElement) { [weak self] waterValue in
            self?.viewOutput?.getWater(water: waterValue)
        }
        healthService.getWater(element: stepElement) { [weak self] stepValue in
            self?.viewOutput?.getSteps(steps: stepValue)
        }
        
    }
    
    
}
