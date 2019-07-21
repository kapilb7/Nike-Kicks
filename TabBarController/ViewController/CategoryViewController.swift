//
//  CategoryViewController.swift
//  TabBarController
//
//  Created by Kapil on 9/17/18.
//  Copyright © 2018 Kapil Balagopal. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let categories: [String] = ["Men", "Women", "Kids"]
    var images: [UIImage]  =  [UIImage(named: "men.png")!, UIImage(named: "women.png")!, UIImage(named: "kids")!]
    
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        self.tableView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.categories.count
        
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Categorycell", for: indexPath) as! CategoryCell
        cell.genderImage.image = self.images[indexPath.item]
        cell.genderLabel.text = self.categories[indexPath.item]
        
    
        
       
    
        
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

