//
//  Clothes.swift
//  ClothesList
//
//  Created by Ladislav Szolik on 10.09.17.
//  Copyright © 2017 Ladislav Szolik. All rights reserved.
//

import UIKit
import os.log

struct Categories {
    static let shirt = "shirt"
    static let pullover = "pullover"
    static let jeans = "jeans"
}

class Clothes:NSObject {
    
    //MARK: Properties
    
    var qrCode: String
    var category: Categories
    var size: Int
    var price: Int
    
    //MARK: Archiving Paths

    init?(name: String, photo: UIImage?, rating: Int) {
        
        // The name must not be empty
        guard !name.isEmpty else {
            return nil
        }
        
        // The rating must be between 0 and 5 inclusively
        guard (rating >= 0) && (rating <= 5) else {
            return nil
        }
        
        // Initialize stored properties.
        self.name = name
        self.photo = photo
        self.rating = rating
    }
 
}
