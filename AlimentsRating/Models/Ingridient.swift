//
//  Ingrient.swift
//  AlimentsRating
//
//  Created by Guilherme Bernava on 22/06/22.
//

import UIKit

class Ingridient: NSObject {
    let name: String
    let kcal: Double
    
    public init(name: String, kcal: Double) {
        self.name = name
        self.kcal = kcal
    }
}
