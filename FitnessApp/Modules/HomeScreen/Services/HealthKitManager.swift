//
//  HealthKitManager.swift
//  FitnessApp
//
//  Created by İbrahim Bayram on 20.04.2023.
//

import Foundation
import HealthKit

protocol HealthService {
    func getWater(element : HealthKitElement, completion : @escaping(Int)->Void)
}

struct HealthKitManager : HealthService {
    
    let healthStore = HKHealthStore()

    func getWater(element : HealthKitElement, completion : @escaping(Int)->Void) {
        let waterType = HKObjectType.quantityType(forIdentifier: element.type)!
        healthStore.requestAuthorization(toShare: [], read: [waterType]) { success, error in
            if success {
                let calender = Calendar.current
                let today = Date()
                let startDate = calender.startOfDay(for: today)
                let endDate = calender.date(byAdding: .day, value: 1, to: startDate)
                let predicate = HKQuery.predicateForSamples(withStart: startDate, end: endDate, options: .strictEndDate)
                let query = HKStatisticsQuery(quantityType: waterType, quantitySamplePredicate: predicate, options: .cumulativeSum) { queryResult, result, error in
                    guard let result = result, let sum = result.sumQuantity() else {return}
                    let value = Int(sum.doubleValue(for: element.unit))
                    completion(value)
                }
                self.healthStore.execute(query)
            }
        }
    }
    
}
