//
//  MainViewController.swift
//  Meet Up Admin
//
//  Created by Abraham Quezada on 1/10/19.
//  Copyright © 2019 Gerardo Castillo Duran . All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var logOutButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var createImage: UIImageView!
    @IBOutlet weak var headImage: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        logOutButton.layer.cornerRadius = 8.0
        logOutButton.layer.masksToBounds = true
        loginButton.layer.cornerRadius = 8.0
        loginButton.layer.masksToBounds = true
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 2.0, delay: 0.3, options: [.curveEaseIn], animations:{
            self.createImage.transform = CGAffineTransform(scaleX: 3.0, y: 3.0)
             self.createImage.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        },
                       completion: nil
        )
    }

}
