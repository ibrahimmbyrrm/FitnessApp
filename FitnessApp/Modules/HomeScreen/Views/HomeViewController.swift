//
//  HomeViewController.swift
//  FitnessApp
//
//  Created by İbrahim Bayram on 19.04.2023.
//

import UIKit
import HealthKit

protocol HomeViewProtocol {
    func getSteps(steps : Int)
    func getWater(water : Int)
}

class HomeViewController: UIViewController{

    @IBOutlet weak var addStepButton: UIButton!
    @IBOutlet weak var addWaterButton: UIButton!
    @IBOutlet weak var stepLabel: UILabel!
    @IBOutlet weak var waterLabel: UILabel!
    @IBOutlet weak var recommendTableView: UITableView!
    
    private let recommendListViewModel = RecommendCellViewModel()
    private let healthKitViewModel : HealthViewModelOutput = HealthViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        healthKitViewModel.setDelegate(output: self)
        healthKitViewModel.fetchData()
    }
    
    @IBAction func addData(_ sender: UIButton) {
        let alert = UIAlertController(title: "Hi There!", message: "Please enter the valu you want to add.", preferredStyle: .alert)
        alert.addTextField { textfield in
            textfield.placeholder = "1000"
            textfield.keyboardType = .numberPad
        }
        let addButton = UIAlertAction(title: "Save Value", style: .default) { action in
            guard let textfields = alert.textFields, let amount = textfields[0].text else {return}
            switch sender {
            case self.addStepButton:
                self.healthKitViewModel.addData(amount: Int(amount) ?? 0, type: StepElement())
            case self.addWaterButton:
                self.healthKitViewModel.addData(amount: Int(amount) ?? 0, type: WaterElement())
            default:
                break
            }
        }
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(addButton)
        alert.addAction(cancelButton)
        self.present(alert, animated: true)
    }
    
}

extension HomeViewController : UITableViewDelegate, UITableViewDataSource, HomeViewProtocol {
    
    func getSteps(steps: Int) {
        stepLabel.changeTextAsync(text: "\(steps) / 10000")
    }
    
    func getWater(water: Int) {
        waterLabel.changeTextAsync(text: "\(water)ml / 3000ml")
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recommendListViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = recommendTableView.dequeueReusableCell(withIdentifier: RecommendCell.identifier, for: indexPath) as! RecommendCell
        let recommendAtIndex = recommendListViewModel.cellForRowAt(index: indexPath.row)
        cell.setup(selected: recommendAtIndex)
        return cell
        
    }
}
