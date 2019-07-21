//
//  passwordViewController.swift
//  TabBarController
//
//  Created by Kapil on 8/24/18.
//  Copyright © 2018 Kapil Balagopal. All rights reserved.
//

import UIKit

class passwordViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var passwordTextField: UITextField!
    
    var iconClick = true

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(passwordViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)  // Allows dismissal of keyboard on tap anywhere on screen besides the keyboard itself
        self.passwordTextField.delegate = self
    }
   
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    @IBAction func goToGen(_ sender: UIButton) {
        if passwordTextField.text == "" {
            
        }
        else{
            newAccount.userPassword = passwordTextField.text!
            performSegue(withIdentifier: "toGen", sender: self)
        }

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
