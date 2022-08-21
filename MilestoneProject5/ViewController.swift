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
        setupNavBarButton()
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
    
    func setupNavBarButton() {
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItem))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))

    }
    
    @objc func addItem() {
        let ac = UIAlertController(title: "Enter shopping Item, then details", message: nil, preferredStyle: .alert)
        ac.addTextField()
        ac.addTextField()

        let submitAction = UIAlertAction(title: "Submit", style: .default) { [weak self, weak ac] _ in
            
            guard let titleItem = ac?.textFields?[0].text?.lowercased() else { return }
            guard let detailsItem = ac?.textFields?[1].text?.lowercased() else { return }

            
            self?.submit(titleItem, detailsOfItem: detailsItem)
        }

        ac.addAction(submitAction)
        present(ac, animated: true)
    }
    
    func submit(_ title: String, detailsOfItem: String) {
//        self.shoppingListItemName.append(title)
//        self.shoppingListItemDetails.append(detailsOfItem)
        
        shoppingListItemName.insert(title, at: 0)
        shoppingListItemDetails.insert(detailsOfItem, at: 0)
        
//
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)

        return
    }
    
    @objc func shareTapped() {
        
        if shoppingListItemName.isEmpty {
            print("No items found.")
            return
        }
        let list = shoppingListItemName.joined(separator: "\n")
        
        let vc = UIActivityViewController(activityItems: [list], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.leftBarButtonItem
        
        present(vc, animated: true)
    }
    
}

