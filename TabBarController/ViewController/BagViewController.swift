//
//  BagViewController.swift
//  TabBarController
//
//  Created by Kapil on 9/29/18.
//  Copyright © 2018 Kapil Balagopal. All rights reserved.
//

import UIKit

class BagViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var images: [UIImage]  =  [UIImage(named: "shoe3.jpg")!, UIImage(named: "shoe4.jpg")!, UIImage(named: "shoe5.jpg")!]
    var prices = [1999, 2999, 5999]
    var names = ["Mercurial", "AirMax", "VaporMax"]

    
    @IBOutlet var tableView2: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView2.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        navigationController?.navigationBar.prefersLargeTitles = true
        
        
        
        tableView2.delegate = self
        tableView2.dataSource = self
    }
    
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
        
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BagCell
        
        cell.productImage.image = self.images[indexPath.item]
        cell.productImage.layer.cornerRadius = 20
        cell.productImage.clipsToBounds = true
        cell.productLabel.text =  "\(self.names[indexPath.item]) \n \(self.prices[indexPath.item])"
        
        
        

        
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


}
