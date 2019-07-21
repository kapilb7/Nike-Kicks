//
//  sizeViewController.swift
//  TabBarController
//
//  Created by Kapil on 8/24/18.
//  Copyright © 2018 Kapil Balagopal. All rights reserved.
//

import UIKit
import RealmSwift

var mySize = ""


class Users: Object {
    @objc dynamic var name: String?
    @objc dynamic var email: String?
    @objc dynamic var password: String?
    @objc dynamic var gender: String?
    @objc dynamic var size: String?
}


class sizeViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet var signUp: UIButton!
    @IBOutlet var sizePicker: UIPickerView!
    @IBOutlet var sizeLabel: UILabel!
  

    
    
    var pickerData: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signUp.layer.cornerRadius = 22.5
        signUp.titleLabel?.font = UIFont(name: "BebasNeue", size: 20)

        self.sizePicker.delegate = self
        self.sizePicker.dataSource = self
        // Input data into the Array:
        pickerData = ["5.5", "6", "6.5", "7", "7.5", "8", "8.5", "9", "9.5", "10", "10.5", "11", "11.5", "12.5", "13.5", "14.5"]
        
}
    
    func createUser(){
        var newAccount2 = Users()
        newAccount2.name = newAccount.userName
        newAccount2.email = newAccount.userEmail
        newAccount2.password = newAccount.userPassword
        newAccount2.gender = newAccount.userGender
        newAccount2.size = String(newAccount.userSize)
        
        try! realm.write {
            realm.add(newAccount2)
        }
    }
    
    //MARK: - Pickerview method
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.sizeLabel.text = pickerData[row]
        mySize = pickerData[row]
        
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let str = pickerData[row]
        return NSAttributedString(string: str, attributes: [NSAttributedString.Key.foregroundColor:UIColor(red: 255/255, green: 143/255, blue: 0, alpha: 1)])
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    @IBAction func toHome(_ sender: UIButton) {
       if sizeLabel.text == "size"
       {
        
        }
       else{
       // newAccount.userSize = Double(mySize)
        createUser()
        UserDefaults.standard.set(1, forKey: "SIGNEDIN")
        performSegue(withIdentifier: "toHome", sender: self)
        }

    }
  
    


}
