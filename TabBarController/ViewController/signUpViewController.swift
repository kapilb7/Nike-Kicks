//
//  signUpViewController.swift
//  TabBarController
//
//  Created by Kapil on 8/24/18.
//  Copyright © 2018 Kapil Balagopal. All rights reserved.
//

import UIKit
class signUpViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var emailTextField: UITextField!
    
    var iconClick = true
       
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(signUpViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)  // Allows dismissal of keyboard on tap anywhere on screen besides the keyboard itself
        self.emailTextField.delegate = self
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
   
    
    func isValidEmail(testStr:String) -> Bool {
        print("validate emilId: \(testStr)")
        let emailRegEx = "^(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?(?:(?:(?:[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+(?:\\.[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+)*)|(?:\"(?:(?:(?:(?: )*(?:(?:[!#-Z^-~]|\\[|\\])|(?:\\\\(?:\\t|[ -~]))))+(?: )*)|(?: )+)\"))(?:@)(?:(?:(?:[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)(?:\\.[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)*)|(?:\\[(?:(?:(?:(?:(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))\\.){3}(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))))|(?:(?:(?: )*[!-Z^-~])*(?: )*)|(?:[Vv][0-9A-Fa-f]+\\.[-A-Za-z0-9._~!$&'()*+,;=:]+))\\])))(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: testStr)
        return result
    }
    
    func showAlert3(){
        
        let title:String
        title = "Invalid Email!"
        let message = "Please enter a valid email address"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default,
                                   handler:{
                                    
                                    action in
                                    alert.dismiss(animated: true, completion: nil)
                                    
                                    
        })
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }

    func showAlert(){
        
        let title:String
        title = "Email address exits!"
        let message = "Please choose another email or sign in with the existing email"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default,
                                   handler:{
                                    
                                    action in
                                    alert.dismiss(animated: true, completion: nil)
                                    
                                    
        })
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }

   
    @IBAction func goToPass(_ sender: UIButton) {
        if isValidEmail(testStr: emailTextField.text!){
           print("validated")
            var tempEmail = emailTextField.text!
             var  results = realm.objects(Users.self).filter("email = '\(tempEmail)'")
            print("received results")
            print(results.count)
            var noOfResults = results.count
            
            if noOfResults == 0{
                newAccount.userEmail = emailTextField.text!
                print("successfully saved!")
                print(newAccount.userEmail)

                performSegue(withIdentifier: "toPass", sender: self)

            }
            else{
                print("Name already taken!")
                showAlert()
            }
            
           /* for i in results {
                if tempEmail == i.email {
                    print("name taken!")
                    showAlert()
                }
                else{
                    print("successfully saved!")
                    newAccount.userEmail = emailTextField.text!
                    performSegue(withIdentifier: "toPass", sender: self)
                }
            }*/
        
        }
        
        else{
            showAlert3()
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
