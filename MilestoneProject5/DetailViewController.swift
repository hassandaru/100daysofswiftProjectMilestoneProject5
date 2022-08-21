//
//  DetailViewController.swift
//  MilestoneProject5
//
//  Created by Hassan Sohail Dar on 21/8/2022.
//

import UIKit

class DetailViewController: UIViewController {
    var titleOfItem = ""
    var detailsOfItems = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = titleOfItem
        drawViewItemsAndSetupConstraint()
    }
    

    
    func drawViewItemsAndSetupConstraint() {
        // Do any additional setup after loading the view.
        let label1 = UILabel()
        label1.translatesAutoresizingMaskIntoConstraints = false
        label1.backgroundColor = UIColor.black
        label1.textColor = UIColor.white
        label1.text = titleOfItem
        label1.sizeToFit()
        
        let details = UILabel()
        details.translatesAutoresizingMaskIntoConstraints = false

//        details.isEditable = false //we dont want it to be editable
        details.textColor = UIColor.white
        details.backgroundColor = UIColor.black
        details.text = detailsOfItems
        details.sizeToFit()

        view.addSubview(label1)
        view.addSubview(details)
        
        //setting up constraints
        //setting up label 1 width / height / up and down i think
        label1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        label1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        label1.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 20).isActive = true
        
        label1.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.2, constant: -10).isActive = true
        //setting up textfield section
        details.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 10).isActive = true
        details.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        details.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 20).isActive = true
//
        details.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.4, constant: 10).isActive = true
        
        details.bottomAnchor.constraint(lessThanOrEqualToSystemSpacingBelow: view.safeAreaLayoutGuide.bottomAnchor, multiplier: 0.1 ).isActive = true
        
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
