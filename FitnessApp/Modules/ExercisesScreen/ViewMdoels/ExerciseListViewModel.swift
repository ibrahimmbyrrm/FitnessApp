//
//  ExerciseListViewModel.swift
//  FitnessApp
//
//  Created by İbrahim Bayram on 22.04.2023.
//

import Foundation
import UIKit

class ExerciseListViewModel {
    
    var exerciseList = [Exercise]()
    var selected : Exercise?
    
    func getData(tableView : UITableView) {
        NetworkManager().fetchData(queryInput: nil, type: Exercise.self, url: .exerciseURL, method: .get) { response in
            switch response {
            case .success(let exerciseList):
                self.exerciseList = exerciseList
                DispatchQueue.main.async {
                    tableView.reloadData()
                }
                
            case.failure(let error):
                print(error.rawValue)
            }
        }
    }
    
    func numberOfItems() -> Int {
        return exerciseList.count
    }
    
    func didSelect(index : Int) -> Exercise {
        return exerciseList[index]
    }
    
    func cellForItemAt(index : Int) -> ExerciseViewModel {
        return ExerciseViewModel(exercise: exerciseList[index])
    }
}

struct ExerciseViewModel {
    var exercise : Exercise
    
    var name : String {
        return exercise.name
    }
    var difficultyColor : UIColor {
        switch exercise.difficulty {
        case "beginner":
            return UIColor.green
        case "intermediate":
            return UIColor.yellow
        default:
            return UIColor.red
        }
    }
    var difficulty : String {
        return exercise.difficulty
    }
    var type : String {
        return exercise.type
    }
}
