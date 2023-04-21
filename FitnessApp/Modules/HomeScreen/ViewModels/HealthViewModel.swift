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
    
    func addData(amount : Int, type : HealthElement)
    func setDelegate(output : HomeViewProtocol)
    func fetchData()
}

class HealthViewModel : HealthViewModelOutput {
    
    var healthService: HealthService = HealthKitManager()
    var viewOutput: HomeViewProtocol?
    
    func setDelegate(output: HomeViewProtocol) {
        self.viewOutput = output
    }
    
    func fetchData() {
        healthService.getData(element: WaterElement()) { [weak self] waterValue in
            self?.viewOutput?.getWater(water: waterValue)
        }
        healthService.getData(element: StepElement()) { [weak self] stepValue in
            self?.viewOutput?.getSteps(steps: stepValue)
        }
    }
    
    func addData(amount : Int, type : HealthElement) {
        healthService.checkAuth(amount: amount, type: type)
        fetchData()
    }
    
    
}
