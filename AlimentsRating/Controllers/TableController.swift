import SwiftUI

class TableController: UITableViewController , AlimentControllerDelegate{
    //ARRAY com os dados para serem renderizados
    var aliments = [Aliment(name: "Rice", happiness: 3)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        return cell
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
        //atualiza os dados na tela
        tableView.reloadData()
    }
    
    //colocando uma string antes do value podemos dar nome para a variavel
    func Remove(item value: Int){
        
    }
}

