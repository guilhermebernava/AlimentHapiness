//
//  Aliment.swift
//  AlimentsRating
//
//  Created by Guilherme Bernava on 16/06/22.
//

import UIKit

class Aliment: NSObject {
    let name : String
    let happiness: String
    let ingridients: [Ingridient]
    
    init(name:String, happiness: Int, ingridients: [Ingridient] = []){
        self.name = name
        self.ingridients = ingridients
        var finalHappiness = ""
        switch happiness {
        case 5:
            finalHappiness = "I Loved!"
            break
        case 4:
            finalHappiness = "I Liked very much!"
            break
        case 3:
            finalHappiness = "I Liked"
            break
        case 2:
            finalHappiness = "I don't like too much"
            break
        case 1:
            finalHappiness = "I don't like at all"
            break
        default:
            finalHappiness = "Ops..."
            break
        }
        self.happiness = finalHappiness
    }
}
