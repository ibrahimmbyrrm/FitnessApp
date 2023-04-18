//
//  WelcomeViewModel.swift
//  FitnessApp
//
//  Created by İbrahim Bayram on 19.04.2023.
//

import Foundation
import UIKit

struct WelcomeListViewModel {
    var slides = [
                WelcomeElement(title: "Exercises for Everyone", description: "Exercises of different difficulty that work different muscles", image: UIImage(named: "welcome1")!),
                WelcomeElement(title: "Take Control of Your Diet", description: "You can learn the nutritional values ​​of any food you want", image: UIImage(named: "welcome2")!),
                WelcomeElement(title: "Time to Move!", description: "See your movement stats.Find out how far is left to your goal", image: UIImage(named: "welcome3")!)
                ]
    
    func numberOfItems() -> Int {
        return slides.count
    }
    
    func cellForItemAt(index : Int) -> WelcomeElement {
        return slides[index]
    }
    
}

