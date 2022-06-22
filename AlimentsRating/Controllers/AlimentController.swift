//
//  AddAlimentController.swift
//  AlimentsRating
//
//  Created by Guilherme Bernava on 16/06/22.
//

import SwiftUI

protocol AlimentControllerDelegate {
    func Add(_ Aliment: Aliment)
}

class AlimentController : UIViewController, UITableViewDataSource, UITableViewDelegate, AddIngredientDelegate{
    
    @IBOutlet weak var IngridientsTable: UITableView?
    //precisa colocar esse @objc quando uma function deve ser usada como OBJECT C FUNC.
    @objc func redirectToAddIngridient() {
        let AddIngridientViewController = AddIngridientViewController(delegate: self)
        
        navigationController?.pushViewController( AddIngridientViewController, animated: true)
    }
    
    func AddIngredient(_ ingredient: Ingridient){
        ingridients.append(ingredient);
        guard let IngridientsTableNotNull = IngridientsTable else {
            return
        }
        
        IngridientsTableNotNull.reloadData();

    }
    
    override func viewDidLoad() {
        let buttonAddIngridient = UIBarButtonItem(title: "Add Ingridient", style: .plain, target: self, action: #selector(redirectToAddIngridient))
        
        navigationItem.rightBarButtonItem = buttonAddIngridient
    }
    
    // MARK: - IBOutlet
    @IBOutlet weak var NameTextField: UITextField?
    @IBOutlet weak var HappinessTextField: UITextField?
    
    var delegate: AlimentControllerDelegate?
    var ingridients = [Ingridient(name:"Rice", kcal: 60.0), Ingridient(name:"Beens", kcal: 30.0)];
    var selectedIngridients: [Ingridient] = []
    
    //MARK: - IBAction
    @IBAction func Add(_ sender: Any) {
        guard let name = NameTextField?.text else {
            return
        }
        if let happinessString = HappinessTextField?.text {
            if let happiness = Int(happinessString) {
                delegate?.Add(Aliment(name: name, happiness: happiness, ingridients: selectedIngridients))
            }
        }
        navigationController?.popViewController(animated: true)
    }
    
    //SEMPRE QUE IMPLEMENTAR METODOS DE DATA SOURCE, DELEGATE
    // DEVE SE LIGAR O UI COM O CODIGO
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingridients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = ingridients[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let touchedCell = tableView.cellForRow(at: indexPath){
            if(touchedCell.accessoryType == .checkmark){
                touchedCell.accessoryType = .none
                let item = ingridients[indexPath.row]
                if let position = selectedIngridients.firstIndex(of: item){
                    selectedIngridients.remove(at: position)
                }
                return
            }
            touchedCell.accessoryType = .checkmark
            selectedIngridients.append(ingridients[indexPath.row])
        }
    }
    
}
