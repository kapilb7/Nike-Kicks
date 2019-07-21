//
//  AccountViewController.swift
//  TabBarController
//
//  Created by Kapil on 8/15/18.
//  Copyright © 2018 Kapil Balagopal. All rights reserved.
//

import UIKit
import RealmSwift

class AccountViewController: UIViewController {
    @IBOutlet var signOut: UIButton!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var genderLabel: UILabel!
    @IBOutlet var sizeLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signOut.layer.cornerRadius  =   22.5
        signOut.titleLabel?.font = UIFont(name: "BebasNeue", size: 25)
        sizeLabel.text = mySize
      

        var check = UserDefaults.standard.value(forKey: "SIGNEDIN")
        
        //var tanDogs = realm.objects(Dog.self).filter("color = 'tan' AND name BEGINSWITH 'B'")
        
        if ((check) as? Int) != nil{
            
            if logInType == 1{
                emailLabel.text = newAccount.userEmail //signInEmail
                var  results = realm.objects(Users.self).filter("email = '\(signInEmail)' AND password = '\(signInPassword)'")
                for i in results{
                    nameLabel.text = i.name
                    genderLabel.text = i.gender
                    //sizeLabel.text = i.size
                    sizeLabel.text = mySize
                    }
                }
            else
            {
              
                if ((UserDefaults.standard.value(forKey: "SIGNEDNOW")) as? Int) == 1 {
                    UserDefaults.standard.set(newAccount.userEmail, forKey: "currEmail")
                    UserDefaults.standard.set(newAccount.userName, forKey: "currName")
                    UserDefaults.standard.set(newAccount.userGender, forKey: "currGender")
                    UserDefaults.standard.set(newAccount.userSize, forKey: "currSize")
                    
                    
                    emailLabel.text = UserDefaults.standard.value(forKey: "currEmail") as! String
                    //newAccount.userEmail
                    nameLabel.text = UserDefaults.standard.value(forKey: "currName") as? String
                    //newAccount.userName
                    genderLabel.text = UserDefaults.standard.value(forKey: "currGender") as? String
                    //newAccount.userGender
                    sizeLabel.text = mySize
                }
                
              /* UserDefaults.standard.set(newAccount.userEmail, forKey: "currEmail")
               UserDefaults.standard.set(newAccount.userName, forKey: "currName")
               UserDefaults.standard.set(newAccount.userGender, forKey: "currGender")
               UserDefaults.standard.set(newAccount.userSize, forKey: "currSize")*/

               else
                {
                print(check!)
                emailLabel.text = UserDefaults.standard.value(forKey: "currEmail") as! String
 //newAccount.userEmail
                nameLabel.text = UserDefaults.standard.value(forKey: "currName") as? String
//newAccount.userName
                genderLabel.text = UserDefaults.standard.value(forKey: "currGender") as? String
 //newAccount.userGender
                sizeLabel.text = mySize //String(newAccount.userSize)
                }
                
                
                
            }
            
    }
        else {
        
            
        print("Not signed in!")
            emailLabel.text = ""
            nameLabel.text = ""
            genderLabel.text = ""
            sizeLabel.text = ""

        
        }
            
        

    }
    @IBAction func signOUT(_ sender: Any) {
        UserDefaults.standard.set(nil, forKey: "email")
        UserDefaults.standard.set(nil, forKey: "SIGNEDIN")
        
        
    }
    
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func clearDB(_ sender: Any) {
   
        try! realm.write {
         realm.delete(realm.objects(Users.self))
 
    }
    


    }


}
