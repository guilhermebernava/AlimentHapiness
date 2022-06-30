//
//  Alerts.swift
//  AlimentsRating
//
//  Created by Guilherme Bernava on 29/06/22.
//
import SwiftUI


func ErrorAlert(title: String = "Error", message: String, buttonTitle: String = "Ok") -> UIAlertController {
    let alert = UIAlertController(title: title, message:message, preferredStyle: .alert)
    let alertButton = UIAlertAction(title: buttonTitle, style: .cancel)
    alert.addAction(alertButton)
    
    return alert
}

func ItemEditAlert(title: String, message: String, editHandler: ((UIAlertAction) -> Void)?) -> UIAlertController {
    let alert = UIAlertController(title: title, message:message, preferredStyle: .alert)
    let okButton = UIAlertAction(title: "Ok", style: .cancel)
    let deleteButton = UIAlertAction(title: "Delete", style: .destructive, handler: editHandler)
    alert.addAction(okButton)
    alert.addAction(deleteButton)
    return alert
}
