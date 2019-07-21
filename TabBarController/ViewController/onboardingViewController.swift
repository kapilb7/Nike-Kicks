//
//  onboardingViewController.swift
//  TabBarController
//
//  Created by Kapil on 8/22/18.
//  Copyright © 2018 Kapil Balagopal. All rights reserved.
//

import UIKit
import CoreData
import RealmSwift

var logInType = 0

struct newUser {
    var userName: String = ""
    var userEmail: String = ""
    var userPassword: String = ""
    var userGender: String = ""
    var userSize: Double = 0.0
}

var signInEmail = ""
var signInPassword = ""

class onboardingViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var signIn: UIButton!
    @IBOutlet var signUp: UIButton!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    var iconClick = true
    

    
    
    @IBAction func signIn(_ sender: UIButton) {
        if emailTextField.text  ==  ""{
            
        }
        else{
           signInEmail = emailTextField.text!
            signInPassword = passwordTextField.text!
            logInType = 1
            UserDefaults.standard.set(1, forKey: "SIGNEDIN")
            performSegue(withIdentifier: "signedIn", sender: self)
        }
    }
   

   
 
    
    @IBAction func signUp(_ sender: UIButton) {
       logInType = 2
        performSegue(withIdentifier: "toName", sender: self)
        UserDefaults.standard.set(1, forKey: "SIGNEDNOW")

}
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(Realm.Configuration.defaultConfiguration.fileURL)
       signIn.layer.cornerRadius = 22.5 //rounded buttons
        signUp.layer.cornerRadius = 22.5
        emailTextField.layer.cornerRadius   =   22.5
        passwordTextField.layer.cornerRadius   =   22.5
            signIn.titleLabel?.font = UIFont(name: "BebasNeue", size: 20)
            signUp.titleLabel?.font = UIFont(name: "BebasNeue", size: 20)
        
    




        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onboardingViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)  // Allows dismissal of keyboard on tap anywhere on screen besides the keyboard itself
        self.emailTextField.delegate = self
        self.passwordTextField.delegate =   self

        
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
