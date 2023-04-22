//
//  ExerciseDetail.swift
//  FitnessApp
//
//  Created by İbrahim Bayram on 22.04.2023.
//

import UIKit

class ExerciseDetail: UIViewController {

    @IBOutlet weak var instructionTextView: UITextView!
    @IBOutlet weak var difficultyLabel: UILabel!
    @IBOutlet weak var equipmentLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var exercise : Exercise?
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.modalPresentationStyle = .overCurrentContext
        self.modalTransitionStyle = .crossDissolve
        
        setupUI(exercise: exercise!)

    }
    
    init(exercise : Exercise) {
        self.exercise = exercise
        super.init(nibName: "ExerciseDetail", bundle: Bundle(for: ExerciseDetail.self))
        self.modalPresentationStyle = .overCurrentContext
        self.modalTransitionStyle = .crossDissolve
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func closeButtonClicked(_ sender: Any) {
        self.dismiss(animated: true)
    }
    func setupUI(exercise : Exercise) {
        self.instructionTextView.text = exercise.instructions
        self.difficultyLabel.text = "Difficulty -> \(exercise.difficulty.uppercased())"
        self.equipmentLabel.text = "Equipment -> \(exercise.equipment.uppercased())"
        self.typeLabel.text = "Type -> \(exercise.type.uppercased())"
        self.nameLabel.text = exercise.name
    }
  
    


}
