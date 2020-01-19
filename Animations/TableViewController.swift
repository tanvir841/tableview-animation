//
//  TableViewController.swift
//  Animations
//
//  Created by Brian Advent on 07/10/2016.
//  Copyright © 2016 Brian Advent. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    let row0text = "Walk the dog"
    let row1text = "Brush teeth"
    let row2text = "Learn iOS development"
    let row3text = "Soccer practice"
    let row4text = "Eat ice cream"
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animateTable()
    }
    

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//
//        return 1
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

       // cell.textLabel?.text = "Cool Effects \(indexPath.row)"
        let label = cell.viewWithTag(1000) as! UILabel
        
        if indexPath.row % 5 == 0 { label.text = "Walk the dog"
        } else if indexPath.row % 5 == 1 { label.text = "Brush my teeth"
        } else if indexPath.row % 5 == 2 { label.text = "Learn iOS development"
        } else if indexPath.row % 5 == 3 { label.text = "Soccer practice"
        } else if indexPath.row % 5 == 4 { label.text = "Eat ice cream" }
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if let cell = tableView.cellForRow(at: indexPath) { if cell.accessoryType == .none {
    cell.accessoryType = .checkmark } else {
    cell.accessoryType = .none }
    }
    tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    func animateTable() {
        tableView.reloadData()
        let cells = tableView.visibleCells
        
        let tableViewHeight = tableView.bounds.size.height
        
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: 0, y: tableViewHeight)
        }
        
        var delayCounter = 0
        for cell in cells {
            UIView.animate(withDuration: 1.75, delay: Double(delayCounter) * 0.05, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: { 
                cell.transform = CGAffineTransform.identity
                }, completion: nil)
            delayCounter += 1
        }
        
       
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

   
}
