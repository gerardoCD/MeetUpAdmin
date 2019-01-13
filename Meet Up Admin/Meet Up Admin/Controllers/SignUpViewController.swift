//
//  SignUpViewController.swift
//  Meet Up Admin
//
//  Created by Abraham Quezada on 1/12/19.
//  Copyright © 2019 Gerardo Castillo Duran . All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        signUpButton.layer.cornerRadius = 8.0
        signUpButton.layer.masksToBounds = true
    }

}
