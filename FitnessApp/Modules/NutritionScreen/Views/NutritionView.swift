//
//  NutritionView.swift
//  FitnessApp
//
//  Created by İbrahim Bayram on 22.04.2023.
//

import UIKit

protocol NutritionViewOutput {
    func setup(food : Food) 
}

class NutritionView: UIViewController, NutritionViewOutput {

    @IBOutlet weak var sugarLabel: UILabel!
    @IBOutlet weak var fiberLabel: UILabel!
    @IBOutlet weak var carbonhydrateLabel: UILabel!
    @IBOutlet weak var cholestrolLabel: UILabel!
    @IBOutlet weak var potassiumLabel: UILabel!
    @IBOutlet weak var sodiumLabel: UILabel!
    @IBOutlet weak var proteinLabel: UILabel!
    @IBOutlet weak var fatLabel: UILabel!
    @IBOutlet weak var servingSizeLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var saturatedFatLabel: UILabel!
    
    var viewModel = NutritionViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        stackView.isHidden = true
        viewModel.setDelegate(output: self)
        // Do any additional setup after loading the view.
    }
    @IBAction func searchButtonClicked(_ sender: Any) {
        searchTextField.endEditing(true)
    }
    func setup(food: Food) {
        self.sugarLabel.changeTextAsync(text: "\(food.sugarG)")
        self.sodiumLabel.changeTextAsync(text: "\(food.sodiumMg)")
        self.caloriesLabel.changeTextAsync(text: "\(food.calories)")
        self.carbonhydrateLabel.changeTextAsync(text: "\(food.carbohydratesTotalG)")
        self.cholestrolLabel.changeTextAsync(text: "\(food.cholesterolMg)")
        self.fatLabel.changeTextAsync(text: "\(food.fatTotalG)")
        self.fiberLabel.changeTextAsync(text: "\(food.fiberG)")
        self.proteinLabel.changeTextAsync(text: "\(food.proteinG)")
        self.saturatedFatLabel.changeTextAsync(text: "\(food.fatSaturatedG)")
        self.potassiumLabel.changeTextAsync(text: "\(food.potassiumMg)")
        self.servingSizeLabel.changeTextAsync(text: "\(food.servingSizeG)")
    }
    
    
}
extension NutritionView : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if searchTextField.text != "" {
            return true
        }else {
            searchTextField.placeholder = "Please type something"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        //Search Process + StackView.isHidden = false
        guard let input = searchTextField.text else {return}
        viewModel.getValues(input: input)
        stackView.isHidden = false
        
        
    }
    
}
