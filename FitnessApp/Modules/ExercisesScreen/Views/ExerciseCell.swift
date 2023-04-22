//
//  ExerciseCell.swift
//  FitnessApp
//
//  Created by İbrahim Bayram on 22.04.2023.
//

import UIKit

class ExerciseCell: UITableViewCell {

    @IBOutlet weak var difficultyLabel: UILabel!
    @IBOutlet weak var muscleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        difficultyLabel.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(exercise : ExerciseViewModel) {
        difficultyLabel.text = exercise.difficulty.uppercased()
        difficultyLabel.backgroundColor = exercise.difficultyColor
        nameLabel.text = exercise.name
        muscleLabel.text = exercise.type.uppercased()
    }

}
