//
//  Ingrient.swift
//  AlimentsRating
//
//  Created by Guilherme Bernava on 22/06/22.
//

import UIKit

class Ingridient: NSObject, NSCoding, Entity{
    func createMessage() -> String {
        return "Kcal: \(self.kcal)"
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(kcal, forKey: "kcal")
    }
    
    required init?(coder: NSCoder) {
        name = coder.decodeObject(forKey: "name") as! String
        kcal = coder.decodeDouble(forKey: "kcal")
    }
    
    let name: String
    let kcal: Double
    
    public init(name: String, kcal: Double) {
        self.name = name
        self.kcal = kcal
    }
}
