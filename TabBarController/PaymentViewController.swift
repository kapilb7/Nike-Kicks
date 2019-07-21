//
//  PaymentViewController.swift
//  TabBarController
//
//  Created by Kapil on 10/11/18.
//  Copyright © 2018 Kapil Balagopal. All rights reserved.
//

import UIKit

class PaymentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var subTotalLabel: UILabel!
    
    @IBOutlet var tableView: UITableView!
    var images: [UIImage]  =  [UIImage(named: "shoe3.jpg")!, UIImage(named: "shoe4.jpg")!]
    var prices = [1999, 2999]
    var names = ["Mercurial", "AirMax"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        subTotalLabel.text = "BAG SUBTOTAL   \(prices[0]+prices[1]) INR"
        totalLabel.text = "TOTAL                   \(prices[0]+prices[1]) INR"

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
        
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckOutcell", for: indexPath) as! CheckOutCell
        cell.finalImage.image = images[indexPath.item]
        cell.finalImage.layer.cornerRadius = 20.0
        cell.finalImage.clipsToBounds = true
        cell.finalLabel.text = String(names[indexPath.item])
        cell.finalPriceLabel.text = String(prices[indexPath.item])+" INR"
        
        
        
        
        
        
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
        cell.textLabel?.textColor   =   UIColor.white
    }

    
    
    
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    

}
