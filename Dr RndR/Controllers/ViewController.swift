//
//  ViewController.swift
//  Dr RndR
//
//  Created by Prabal Kumar on 17/04/24.
//

import UIKit

class ViewController: UIViewController {
    
    var myScanImages = ["scan","scan","scan","scan","scan"]

    @IBOutlet weak var scansCard: UIView!
    
    @IBOutlet var scansCardTwo: UIView!
    
    @IBOutlet var scansCardThree: UIView!
    
    @IBOutlet var scansCardFour: UIView!
    
    @IBOutlet var scansCardFive: UIView!
    
    
    
    
    @IBOutlet var myCollectionView: UICollectionView!



    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        scansCard.layer.cornerRadius = 10
        scansCardTwo.layer.cornerRadius = 10
        scansCardThree.layer.cornerRadius = 10
        scansCardFour.layer.cornerRadius = 10
        scansCardFive.layer.cornerRadius = 10
        
        
        let allScannedModels = ScannedModelManager().getAllScannedModels()
        for model in allScannedModels {
            print("Model Name: \(model.modelName)")
            print("File Path: \(model.filePath)")
            print("------------")
        }
        print("no models")
    }


    @IBAction func ButtonTapped(_ sender: UIBarButtonItem) {
        
        let newAlert = UIAlertController(title: "Room name", message: "Enter rooom name", preferredStyle: .alert)
        
        newAlert.addAction(UIAlertAction(title: "Done", style: .default))
        
        newAlert.addAction(UIAlertAction(title: "Cancel", style: .default))
        
        newAlert.addTextField()
        
        self.present(newAlert, animated: true)
    }
}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myScanImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCollectionViewCell
        
        cell.myScanImage.image = UIImage(named: myScanImages[indexPath.row])
        
        return cell
    }
    
    
}

