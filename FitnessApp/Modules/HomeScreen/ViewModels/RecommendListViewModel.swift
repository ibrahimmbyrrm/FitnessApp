//
//  RecommendListViewModel.swift
//  FitnessApp
//
//  Created by İbrahim Bayram on 19.04.2023.
//

import Foundation
import UIKit

struct RecommendCellViewModel {
    let recommends = [Recommend(image: "fibreFoods", description: "Foods containing lots of fibre can help keep you feeling full, which is perfect for losing weight. Fibre is only found in food from plants, such as fruit and veg, oats, wholegrain bread, brown rice and pasta, and beans, peas and lentils."),Recommend(image: "noAlcohol", description: "A standard glass of wine can contain as many calories as a piece of chocolate. Over time, drinking too much can easily contribute to weight gain."),Recommend(image: "breakfast", description: "Skipping breakfast will not help you lose weight. You could miss out on essential nutrients and you may end up snacking more throughout the day because you feel hungry."),Recommend(image: "burn", description: "Eating at regular times during the day helps burn calories at a faster rate. It also reduces the temptation to snack on foods high in fat and sugar.")]
    
    func numberOfRowsInSection() -> Int {
        return recommends.count
    }
    
    func cellForRowAt(index : Int) -> RecommendViewModel {
        return RecommendViewModel(recommend: recommends[index])
    }
    
}

struct RecommendViewModel {
    let recommend : Recommend
    
    var image : UIImage {
        return UIImage(named: recommend.image)!
    }
    var description : String {
        return recommend.description
    }
}
