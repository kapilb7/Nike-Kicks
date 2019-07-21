//
//  genderViewController.swift
//  TabBarController
//
//  Created by Kapil on 8/24/18.
//  Copyright © 2018 Kapil Balagopal. All rights reserved.
//

import UIKit

class genderViewController: UIViewController {
    @IBOutlet var choosingGender: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func goToSize(_ sender: UIButton) {
        var gender = choosingGender.titleForSegment(at: choosingGender.selectedSegmentIndex)
        newAccount.userGender = gender!
        performSegue(withIdentifier: "toSize", sender: self)

    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}
