//
//  AddIngridientViewController.swift
//  AlimentsRating
//
//  Created by Guilherme Bernava on 22/06/22.
//

import UIKit

protocol AddIngredientDelegate{
    func AddIngredient(_ value: Ingridient)
}

class AddIngridientViewController: UIViewController {
    
    @IBOutlet weak var NameTextField: UITextField?
    @IBOutlet weak var KcalTextField: UITextField?
    
    var delegate: AddIngredientDelegate?
    
    init(delegate: AddIngredientDelegate){
        super.init(nibName: "AddIngridientViewController", bundle: nil)
        self.delegate = delegate;
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @IBAction func AddIngridient(_ sender: Any) {
        guard let name = NameTextField?.text else{return}
        guard let kcalText = KcalTextField?.text else {return}
        guard let kcal = Double(kcalText) else {return}
        
        //o  ?  serve como if let, se existir o delegate ele irá rodar
        //caso nn exista ele só vai ignorar.
        delegate?.AddIngredient(Ingridient(name: name, kcal: kcal)) 
        
        navigationController?.popViewController(animated:true)
    }
}
