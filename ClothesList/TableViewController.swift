//
//  ViewController.swift
//  ClothesList
//
//  Created by Ladislav Szolik on 09.09.17.
//  Copyright © 2017 Ladislav Szolik. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController{

    @IBOutlet weak var clothesListTable: UITableView!
    
    
    var listOfClothes = ["shirt", "jacket"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfClothes.count
    }
    
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = listOfClothes[indexPath.row]
        return cell
    }
    

    //MARK: Actions
    @IBAction func unwindToClothesList(sender:UIStoryboardSegue) {
        if let sourceViewController = sender.source as? ClothesViewController, let category = sourceViewController.categoryLabel.text {
           
            let newIndexPath = IndexPath(row: listOfClothes.count, section: 0)
            listOfClothes.append(category)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

