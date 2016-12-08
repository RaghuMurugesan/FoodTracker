//
//  Meal.swift
//  FoodTracker
//
//  Created by rag on 12/5/16.
//  Copyright © 2016 rag. All rights reserved.
//

import UIKit

class Meal {
    // MARK: Properties
    
    var name: String
    var photo: UIImage?
    var rating: Int
    
    //MARK: Initialization
    
    init?(name: String, photo: UIImage?, rating: Int) {
        // Initialize stored properties.
        self.name = name
        self.photo = photo
        self.rating = rating
        
        // Initialization should fail if there id no name or if the rating is negative.
        if name.isEmpty || rating < 0 {
            return nil
        }
        
    }
}
