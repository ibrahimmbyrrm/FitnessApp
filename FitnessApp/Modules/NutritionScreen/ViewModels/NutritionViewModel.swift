//
//  NutritionViewModel.swift
//  FitnessApp
//
//  Created by İbrahim Bayram on 22.04.2023.
//

import Foundation

protocol NutritionViewModelOutput {
    func getValues(input : String)
    func setDelegate(output : NutritionViewOutput)
    var nutritionView : NutritionViewOutput? {get}
}

class NutritionViewModel : NutritionViewModelOutput {
    func setDelegate(output: NutritionViewOutput) {
        self.nutritionView = output
    }
    
    var nutritionView: NutritionViewOutput?
    

    func getValues(input : String) {
        NetworkManager().fetchData(queryInput: input, type: Food.self, url: .nutritionURL, method: .get) { response in
            switch response {
            case .success(let food):
                guard let foodValues = food.first else {return}
                self.nutritionView?.setup(food: foodValues)
            case.failure(let error):
                print(error.rawValue)
            }
        }
    }
}
