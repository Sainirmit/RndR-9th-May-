//
//  ScansViewController.swift
//  Dr RndR
//
//  Created by Prabal Kumar on 26/04/24.
//

import UIKit

class ScansViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return scanNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = scansCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ScansCollectionViewCell
        cell.scanImageView.image = UIImage(named: scanImages[indexPath.row])
        cell.scanLabelView.text = scanNames[indexPath.row]
        return cell
    }
    

    @IBOutlet var topImageView: UIImageView!
    
    @IBOutlet var scansCollectionView: UICollectionView!
    
    var scanImages:[String] = ["scan","scan","scan","scan","scan"]
    
    var scanNames:[String] = ["Demo 1","Demo 2","Demo 3","Demo 4","Demo 5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        topImageView.layer.cornerRadius = 10
        
        let nibCell = UINib(nibName: "ScansCollectionViewCell", bundle: nil)
        
        scansCollectionView.register(nibCell, forCellWithReuseIdentifier: "cell")
        
        
        
    }
    

    @IBAction func CheckModel(_ sender: UIButton) {
        let allScannedModels = ScannedModelManager().getAllScannedModels()
        for model in allScannedModels {
            print("Model Name: \(model.modelName)")
            print("File Path: \(model.filePath)")
            print("------------")
        }
        print("no models")
    }
    

}
