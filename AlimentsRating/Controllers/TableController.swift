import SwiftUI

class TableController: UITableViewController , AlimentControllerDelegate{
    //ARRAY com os dados para serem renderizados
    var aliments = [Aliment(name: "Rice and Beens", happiness: 3, ingridients: [Ingridient(name: "Rice", kcal: 56), Ingridient(name: "Beens", kcal: 30)])]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let savedAliments = AlimentDao.GetAlimentsFromFile() else {return}
        aliments = savedAliments
    }
    
    //OBRIGADO A IMPLEMENTAR O DATA SOURCE DA TABLE VIEW
    
    //vai falar para a TABLE VIEW quantos ITENS serao renderizados
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return aliments.count
    }
    
    //vai passar os ITENS para serem renderizados pela TABLE VIEW
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = aliments[indexPath.row].name
        //cria uma function para ser adicionada na cell
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(editAliment))
        //adiciona a function de clicar dentro da cell
        cell.addGestureRecognizer(longPress)
        return cell
    }
    
    @objc func editAliment(_ gesture: UILongPressGestureRecognizer){
        //verifica se o usuario comecou a clicar
        if gesture.state == .began { 
            if let cell = GetCellFromGestureView(gesture.view){
                guard let item = GetItemFromCell(cell, tableView: tableView, list: aliments) else {return}
                guard let index = GetIndexOfCell(cell, tableView: tableView) else {return}
                //criando um ALERT
                let alert = ItemEditAlert(title: item.name, message: item.createMessage(),
                //closure, para passar os parametros devemos colocar eles antes do IN
                editHandler: { _ in
                    self.aliments.remove(at: index)
                    self.tableView.reloadData()
                })
                
                present(alert, animated: true)
            }
        }
    }
    
    //metodo que vai ser rodado antes da troca de TELA
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //vai verificar se o segue "a seta que leva até a outra tela"
        //tem esse identificador.
        if(segue.identifier == "create"){
            //verifica se o destino da proxima tela é do tipo ALIMENT CONTROLLER
            if let controller = segue.destination as? AlimentController {
                //caso for ele passa o dado para variavel.
                controller.delegate = self
            }
        }
    }
    
    //o _ serve para ocultar o nome dos parametros quando o metodo for chamado.
    func Add(_ Aliment: Aliment){
        aliments.append(Aliment)
        AlimentDao.SaveAlimentsInFile(aliments)
        //atualiza os dados na tela
        tableView.reloadData()
    }
    
    //colocando uma string antes do value podemos dar nome para a variavel
    func Remove(item value: Int){
        
    }
}

