//
//  MyEventsDescriptionViewController.swift
//  Meet Up Admin
//
//  Created by Abraham Quezada on 1/13/19.
//  Copyright © 2019 Gerardo Castillo Duran . All rights reserved.
//

import UIKit

class MyEventsDescriptionViewController: UIViewController {
    
    @IBOutlet weak var scanButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        scanButton.layer.cornerRadius = 8.0
        scanButton.layer.masksToBounds = true
    }
    
}
