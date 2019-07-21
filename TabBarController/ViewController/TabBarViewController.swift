//
//  TabBarViewController.swift
//  TabBarController
//
//  Created by Kapil on 8/5/18.
//  Copyright © 2018 Kapil Balagopal. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //For the bottom bar
//        UITabBar.appearance().barTintColor = UIColor(red: 255/255, green: 111/255, blue: 0/255, alpha: 1)
    

        //For the above bar
//        UINavigationBar.appearance().barTintColor = UIColor(red: 50/255, green: 216/255, blue: 13/255, alpha: 0.5)
//        UINavigationBar.appearance().tintColor = UIColor.green
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
