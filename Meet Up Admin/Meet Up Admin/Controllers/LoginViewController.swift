//
//  LoginViewController.swift
//  Meet Up Admin
//
//  Created by Abraham Quezada on 1/12/19.
//  Copyright © 2019 Gerardo Castillo Duran . All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        signInButton.layer.cornerRadius = 8.0
        signInButton.layer.masksToBounds = true
    }

}
