//
//  ExcercisesViewController.swift
//  FitnessApp
//
//  Created by İbrahim Bayram on 22.04.2023.
//

import UIKit

class ExcercisesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let viewModel = ExerciseListViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel.getData(tableView: tableView)
    }
    
}
extension ExcercisesViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.present(ExerciseDetail(exercise: viewModel.didSelect(index: indexPath.row)), animated: true)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfItems()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "exerciseCell", for: indexPath) as! ExerciseCell
        let exercise = viewModel.cellForItemAt(index: indexPath.row)
        cell.setup(exercise: exercise)
        return cell
    }
}

