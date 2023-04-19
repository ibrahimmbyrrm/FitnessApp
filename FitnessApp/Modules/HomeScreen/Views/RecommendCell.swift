//
//  RecommendCell.swift
//  FitnessApp
//
//  Created by İbrahim Bayram on 19.04.2023.
//

import UIKit

class RecommendCell: UITableViewCell {

    static let identifier = "recommendCell"
    
    @IBOutlet weak var recommendImage: UIImageView!
    @IBOutlet weak var textView: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(selected : RecommendViewModel) {
        recommendImage.image = selected.image
        textView.text = selected.description
    }

}
