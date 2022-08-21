//
//  ViewController.swift
//  MilestoneProject5
//
//  Created by Hassan Sohail Dar on 21/8/2022.
//

import UIKit

class ViewController: UITableViewController {
    var shoppingListItemName = [String]()
    var shoppingListItemDetails = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        shoppingListItemName = ["check" ]
        shoppingListItemDetails = ["first Item Details"]
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        shoppingListItemName.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingItem", for: indexPath)
        cell.textLabel?.text = shoppingListItemName[indexPath.row]
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "DetailView") as? DetailViewController {
            vc.titleOfItem = shoppingListItemName[indexPath.row]
            vc.detailsOfItems = shoppingListItemDetails[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)

        }
    }
}

