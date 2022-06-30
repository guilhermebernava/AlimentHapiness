//
//  Aliment.swift
//  AlimentsRating
//
//  Created by Guilherme Bernava on 16/06/22.
//

import UIKit

class Aliment: NSObject, NSCoding, Entity {
    
    //serve para converter a class em Bytes para ser salvo no dispositivo
    func encode(with coder: NSCoder) {
        coder.encode(name,forKey: "name")
        coder.encode(happiness,forKey: "happiness")
        coder.encode(ingridients,forKey: "ingridients")
    }
    
    required init?(coder: NSCoder) {
        name = coder.decodeObject(forKey: "name") as! String
        happiness = coder.decodeObject(forKey: "happiness") as! String
        ingridients = coder.decodeObject(forKey: "ingridients") as! [Ingridient]
    }
    
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
    
    func createMessage() -> String {
        var message = "Happiness: \(self.happiness) \n Ingredients: \n"
        
        if(ingridients.isEmpty){
            message += "no ingridients for this aliment!"
            return message
        }

        for item in self.ingridients {
            message += "\(item.name) - Kcal \(item.kcal)\n"
        }
        return message
    }
}
