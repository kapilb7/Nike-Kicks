//
//  ViewController.swift
//  TabBarController
//
//  Created by Kapil on 7/24/18.
//  Copyright © 2018 Kapil Balagopal. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //For the bottom bar
        UITabBar.appearance().barTintColor = UIColor(red: 17/255, green: 10/255, blue: 51/255, alpha: 1)
        //For the above bar
        UINavigationBar.appearance().barTintColor = UIColor(red: 50/255, green: 216/255, blue: 13/255, alpha: 0.5)
        UINavigationBar.appearance().tintColor = UIColor.green
        
        
       /* let appDelegate =   UIApplication.shared.delegate as! AppDelegate
        
        let context =   appDelegate.persistentContainer.viewContext
        
        let newUser =   NSEntityDescription.insertNewObject(forEntityName: "Accounts", into: context)
        newUser.setValue("Dorsey", forKey: "name")
        newUser.setValue("Dorsey123", forKey: "password")
        
        do
        {
            try context.save()
            print("Saved")
        }
        catch
        {
//            Error
            print("Not Saved")
        }  */
 
        

    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
  
}

