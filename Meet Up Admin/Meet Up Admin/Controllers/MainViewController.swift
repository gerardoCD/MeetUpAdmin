//
//  MainViewController.swift
//  Meet Up Admin
//
//  Created by Abraham Quezada on 1/10/19.
//  Copyright © 2019 Gerardo Castillo Duran . All rights reserved.
//

import UIKit
import FirebaseAuth


class MainViewController: UIViewController {
    
    @IBOutlet weak var logOutButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var createImage: UIImageView!
    @IBOutlet weak var headImage: UIImageView!
    @IBOutlet weak var splashImageTwo: UIImageView!
    @IBOutlet weak var splashImage: UIImageView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        if Auth.auth().currentUser != nil {
            loginButton.isHidden = true
            logOutButton.isHidden = false
        }else{
            loginButton.isHidden = false
            logOutButton.isHidden = true
        }

        logOutButton.layer.cornerRadius = 8.0
        logOutButton.layer.masksToBounds = true
        loginButton.layer.cornerRadius = 8.0
        loginButton.layer.masksToBounds = true
        splashImage.alpha = 0.0
        splashImageTwo.alpha = 1.0
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 2.0, delay: 0.3, options: [.curveEaseIn], animations:{
            self.createImage.transform = CGAffineTransform(scaleX: 3.0, y: 3.0)
             self.createImage.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        },
                       completion: nil
        )
        
        UIView.animate(withDuration: 7, delay: 0.3, options: [.curveEaseInOut, .repeat, .autoreverse], animations:{
            self.splashImageTwo.alpha = 0.0
            self.splashImage.alpha = 1.0
        },
                       completion: nil
        )
        
        if Auth.auth().currentUser != nil {
            loginButton.isHidden = true
            logOutButton.isHidden = false
        }else{
            loginButton.isHidden = false
            logOutButton.isHidden = true
        }
    }
    
    
    @IBAction func LogInAction(_ sender: UIButton) {
    }
    
    @IBAction func LogOutAxtion(_ sender: UIButton) {
        do{
            try Auth.auth().signOut()
            logOutButton.isHidden = true
            loginButton.isHidden = false
            
        }catch{
            let alert = UIAlertController(title: "Error", message: "You can't Log Out", preferredStyle: .alert )
            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler:nil))
            self.present(alert, animated: true)
        }
    }
    
    

}
