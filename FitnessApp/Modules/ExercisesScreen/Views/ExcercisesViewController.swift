//
//  ExcercisesViewController.swift
//  FitnessApp
//
//  Created by İbrahim Bayram on 22.04.2023.
//

import UIKit

class ExcercisesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        // Do any additional setup after loading the view.
    }
    
    func getData() {
        NetworkManager().fetchData(queryInput: "4 eggs", type: Food.self, url: .nutritionURL, method: .get) { response in
            switch response {
            case .success(let list):
                print(list[0].calories)
            case .failure(let error):
                print(error.rawValue)
            }
        }
    }
    

}
