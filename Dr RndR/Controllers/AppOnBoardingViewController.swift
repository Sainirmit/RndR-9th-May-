//
//  AppOnBoardingViewController.swift
//  Dr RndR
//
//  Created by Piyush saini on 01/05/24.
//

import UIKit

class AppOnBoardingViewController: UIViewController {
    @IBAction func continueBtn(_ sender: UIButton) {
        if let viewController = self.storyboard?.instantiateViewController(
            withIdentifier: "TabBarViewController") {
            viewController.modalPresentationStyle = .fullScreen
            present(viewController, animated: true)
        }
    }
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


