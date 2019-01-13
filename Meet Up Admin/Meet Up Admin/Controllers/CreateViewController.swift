//
//  CreateViewController.swift
//  Meet Up Admin
//
//  Created by Abraham Quezada on 1/10/19.
//  Copyright © 2019 Gerardo Castillo Duran . All rights reserved.
//

import UIKit

class CreateViewController: UIViewController {
    
    
    @IBOutlet weak var createButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createButton.layer.cornerRadius = 8.0
        createButton.layer.masksToBounds = true
        }
    
}
