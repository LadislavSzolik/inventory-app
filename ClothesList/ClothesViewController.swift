//
//  ClothesViewController.swift
//  ClothesList
//
//  Created by Ladislav Szolik on 10.09.17.
//  Copyright © 2017 Ladislav Szolik. All rights reserved.
//

import UIKit

class ClothesViewController: UIViewController {

    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var QRCodeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        let result = formatter.string(from: date)
        dateLabel.text = result
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: Actions
    @IBAction func unwindToNewClothes(sender:UIStoryboardSegue) {
        if let sourceViewController = sender.source as? CategoriesViewController, let category = sourceViewController.chosenCategory {
            categoryLabel.text = category
        } else if let sourceViewController = sender.source as? ScannerViewController, let qrcode = sourceViewController.qrcode {
            QRCodeLabel.text = qrcode
        }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
