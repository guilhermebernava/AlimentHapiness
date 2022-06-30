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
    @IBOutlet weak var NameTextField: UITextField?
    @IBOutlet weak var HappinessTextField: UITextField?
    
    var delegate: AlimentControllerDelegate?
    var ingridients = [Ingridient(name:"Rice", kcal: 60.0), Ingridient(name:"Beens", kcal: 30.0)];
    var selectedIngridients: [Ingridient] = []
    
    //precisa colocar esse @objc quando uma function deve ser usada como OBJECT C FUNC.
    @objc func redirectToAddIngridient() {
        let AddIngridientViewController = AddIngridientViewController(delegate: self)
        navigationController?.pushViewController( AddIngridientViewController, animated: true)
    }
    
    func AddIngredient(_ ingredient: Ingridient){
        ingridients.append(ingredient);
        IngridientDao.SaveIngridientInFile(ingridients)
        guard let IngridientsTableNotNull = IngridientsTable else {
            let alert = ErrorAlert(message: "sorry can't add your ingridient")
            present(alert, animated: true)
            return
        }
        IngridientsTableNotNull.reloadData();
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let buttonAddIngridient = UIBarButtonItem(title: "Add Ingridient", style: .plain, target: self, action: #selector(redirectToAddIngridient))
        navigationItem.rightBarButtonItem = buttonAddIngridient
        
        navigationItem.titleView?.tintColor = UIColor.white
        
        guard let savedIngridients = IngridientDao.GetIngridientsFromFile() else {return}
        ingridients = savedIngridients
        
        
    }
    
    // MARK: - IBOutlet
    
    func CreateAlimentFromForm() -> Aliment?{
        guard let name = NameTextField?.text else {return nil}
        guard let happinessString = HappinessTextField?.text else {return nil}
        guard let happiness = Int(happinessString) else { return nil}
        
        if(happiness < 1 || happiness > 5){
            let alert = ErrorAlert(message: "Happiness must to be 1 to 5!")
            present(alert, animated: true)
            return nil
        }
        
        return Aliment(name: name, happiness: happiness, ingridients: selectedIngridients)
    }
    
    //MARK: - IBAction
    @IBAction func Add(_ sender: Any) {
        if let aliment = CreateAlimentFromForm() {
            delegate?.Add(aliment)
            navigationController?.popViewController(animated: true)
        } else{
            let alert = ErrorAlert(message: "sorry, couldn't create your aliment")
            present(alert, animated: true)
        }
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


