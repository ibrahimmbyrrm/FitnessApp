//
//  HomeViewController.swift
//  FitnessApp
//
//  Created by İbrahim Bayram on 19.04.2023.
//

import UIKit

protocol HomeViewProtocol {
    func getSteps(steps : Int)
    func getWater(water : Int)
}

class HomeViewController: UIViewController{

    @IBOutlet weak var stepLabel: UILabel!
    @IBOutlet weak var waterLabel: UILabel!
    @IBOutlet weak var recommendTableView: UITableView!
    
    let recommendListViewModel = RecommendCellViewModel()
    let healthKitViewModel : HealthViewModelOutput = HealthViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        healthKitViewModel.setDelegate(output: self)
        healthKitViewModel.fetchData()
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
