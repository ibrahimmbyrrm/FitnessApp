//
//  HomeViewController.swift
//  FitnessApp
//
//  Created by İbrahim Bayram on 19.04.2023.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var recommendTableView: UITableView!
    
    let recommendListViewModel = RecommendCellViewModel()
   
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

}
extension HomeViewController : UITableViewDelegate, UITableViewDataSource {
    
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
