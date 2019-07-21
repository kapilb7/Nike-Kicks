//
//  ProductViewController.swift
//  TabBarController
//
//  Created by Kapil on 10/10/18.
//  Copyright © 2018 Kapil Balagopal. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {
    @IBOutlet var productImageView: UIImageView!
    @IBOutlet var productNameLabel: UILabel!
    @IBOutlet var productPriceLabel: UILabel!
    @IBOutlet var save: UIButton!
    @IBOutlet var buy: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        save.layer.cornerRadius = 20.0
        buy.layer.cornerRadius = 20.0
        productImageView.image = chosenImage
        productImageView.layer.cornerRadius = 20.0
        productImageView.clipsToBounds = true
        
        productNameLabel.text = chosenImageName
        productPriceLabel.text = String(chosenImagePrice)+"INR"

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveProduct(_ sender: Any) {
    }
    
    @IBAction func buyProduct(_ sender: Any) {
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }


}
