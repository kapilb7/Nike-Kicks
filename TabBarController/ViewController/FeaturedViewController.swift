//
//  FeaturedViewController.swift
//  TabBarController
//
//  Created by Kapil on 8/22/18.
//  Copyright © 2018 Kapil Balagopal. All rights reserved.
//

import UIKit


var chosenImage = UIImage(named: "shoeSample1.png")
var chosenImagePrice = 0
var chosenImageName = ""

class FeaturedViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet var collectionView: UICollectionView!
  
    
    
    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
    var images: [UIImage]  =  [UIImage(named: "shoe3.jpg")!, UIImage(named: "shoe4.png")!, UIImage(named: "shoe5.jpg")!, UIImage(named: "shoe3.jpg")!, UIImage(named: "shoe9.jpg")!]
    var prices = [1999, 2999, 5999, 3999, 7999]
    var names = ["Mercurial", "AirMax", "VaporMax", "Lunar ", "Hyper 7"]
    

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return self.items.count
        return images.count
    }
    
   
    
   /* @objc func connected(_ sender:AnyObject){
        print("you tap image number :")
       performSegue(withIdentifier: "toProduct", sender: self)
        
    } */
    
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! CollectionViewCell
        
       // cell.shoeName.text = self.items[indexPath.item]
        cell.productView.layer.cornerRadius =  20.0
        
        cell.productImage.isUserInteractionEnabled = true
        // let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(FeaturedViewController.connected(_:)))
          // cell.productImage.addGestureRecognizer(tapGestureRecognizer)
        
        
        
        cell.productImage.clipsToBounds = true
        cell.productImage.layer.cornerRadius =  20.0

      
        cell.productImage.image   = self.images[indexPath.item]
        cell.shoeName.text   =   self.names[indexPath.item]

        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
        
        var chosen = indexPath.item
        chosenImage = self.images[chosen]
        chosenImageName = self.names[chosen]
        chosenImagePrice = self.prices[chosen]
        print("changed values")
        performSegue(withIdentifier: "toProduct", sender: self)
        
    }
    


    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        

    }

    
    
    
    
    

    
    


    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}
