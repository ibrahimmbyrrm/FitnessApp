//
//  WelcomeCell.swift
//  FitnessApp
//
//  Created by İbrahim Bayram on 19.04.2023.
//

import UIKit

class WelcomeCell: UICollectionViewCell {
    static let identifier = "WelcomeCell"
    
    @IBOutlet weak var welcomeImage: UIImageView!
    @IBOutlet weak var welcomeTitle: UILabel!
    @IBOutlet weak var welcomeDescription: UILabel!
    
    func setupCell(element : WelcomeElement) {
        welcomeImage.image = element.image
        welcomeTitle.text = element.title
        welcomeDescription.text = element.description
    }
}
