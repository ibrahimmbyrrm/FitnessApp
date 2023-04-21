//
//  HealthKitManager.swift
//  FitnessApp
//
//  Created by İbrahim Bayram on 20.04.2023.
//

import Foundation
import HealthKit



protocol HealthService {
    var healthStore : HKHealthStore {get}
    
    func getData(element : HealthElement, completion : @escaping(Int)->Void)
    func checkAuth(amount : Int, type : HealthElement)
}

struct HealthKitManager : HealthService {
    
    let healthStore = HKHealthStore()

    func getData(element : HealthElement, completion : @escaping(Int)->Void) {
        let waterType = HKObjectType.quantityType(forIdentifier: element.type)!
        healthStore.requestAuthorization(toShare: [], read: [waterType]) { success, error in
            if success {
                let calender = Calendar.current
                let today = Date()
                let startDate = calender.startOfDay(for: today)
                let endDate = calender.date(byAdding: .day, value: 1, to: startDate)
                let predicate = HKQuery.predicateForSamples(withStart: startDate, end: endDate, options: .strictEndDate)
                let query = HKStatisticsQuery(quantityType: waterType, quantitySamplePredicate: predicate, options: .cumulativeSum) { queryResult, result, error in
                    guard let result = result, let sum = result.sumQuantity() else {
                       completion(0)
                        return
                    }
                    let value = Int(sum.doubleValue(for: element.unit))
                    completion(value)
                }
                self.healthStore.execute(query)
            }
        }
    }
    
    func checkAuth(amount : Int, type : HealthElement) {
        let typesToRead: Set = [HKObjectType.quantityType(forIdentifier: type.type)!]
           healthStore.requestAuthorization(toShare: typesToRead, read: typesToRead) { (success, error) in
               if success {
                   print("Authorization succeeded")
                   let stepCountType = HKQuantityType.quantityType(forIdentifier: type.type)!
                   let stepCountQuantity = HKQuantity(unit: type.unit, doubleValue: Double(amount))
                   let stepCountSample = HKQuantitySample(type: stepCountType, quantity: stepCountQuantity, start: Date(), end: Date())
                   healthStore.save(stepCountSample) { success, error in
                       if success {
                           print("data saved")
                       }else {
                           print(error?.localizedDescription)
                       }
                   }

               } else {
                   print(error?.localizedDescription ?? "Authorization failed")
               }
           }
    }
}
