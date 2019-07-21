//
//  nameViewController.swift
//  TabBarController
//
//  Created by Kapil on 8/24/18.
//  Copyright © 2018 Kapil Balagopal. All rights reserved.
//

import UIKit
import CoreData
import RealmSwift
let realm = try! Realm()
var results = realm.objects(Users.self) // get existing users
var newAccount = newUser() //instance of structure to hold new user info temporarily
class nameViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var nameTextField: UITextField!
        var iconClick = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.layer.cornerRadius = 22.5

        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onboardingViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)  // Allows dismissal of keyboard on tap anywhere on screen besides the keyboard itself
        self.nameTextField.delegate =   self
    }
   
    func showAlert2(){
        
        let title:String
        title = "No name entered!"
        let message = "Please your name"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default,
                                   handler:{
                                    
                                    action in
                                    alert.dismiss(animated: true, completion: nil)
                                    
                                    
        })
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }

    
    @IBAction func toEmail(_ sender: UIButton) {
        
//        UserDefaults.standard.set(nameTextField.text, forKey: "nameKey")
       
        if nameTextField.text   ==  ""{
            showAlert2()
        }
        else{
            newAccount.userName = nameTextField.text!
            performSegue(withIdentifier: "toEmail", sender: self)
        }

    }
    
    // Making the status bar items light
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status and drop into background
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    


}
