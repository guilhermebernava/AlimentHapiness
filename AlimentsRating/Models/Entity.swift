//
//  Entity.swift
//  AlimentsRating
//
//  Created by Guilherme Bernava on 30/06/22.
//

import Foundation

protocol Entity{
    func createMessage() -> String
    var name:String { get }
}

protocol Controller{
    var list:  Array<Any> { get set }
}
