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
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgEvent: UIImageView!
    @IBOutlet weak var lblStartDate: UILabel!
    @IBOutlet weak var lblEndDate: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblSold: UILabel!
    var price = 0.0
    var title2 = ""
    var img = UIImage()
    var startDate = ""
    var endDate = ""
    var sold = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        lblTitle.text = title2
        imgEvent.image = img
        lblStartDate.text = startDate
        lblEndDate.text = endDate
        scanButton.layer.cornerRadius = 8.0
        scanButton.layer.masksToBounds = true
    }
    
}
