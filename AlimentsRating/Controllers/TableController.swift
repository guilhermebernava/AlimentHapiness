import SwiftUI

class TableController: UITableViewController {
    let aliments = ["Rice", "Ice Cream", "Honey", "Pizza", "Pasta"]
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return aliments.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = aliments[indexPath.row]
        
        return cell
    }
}

