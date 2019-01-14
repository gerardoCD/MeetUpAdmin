//
//  MyEventsViewController.swift
//  Meet Up Admin
//
//  Created by Abraham Quezada on 1/11/19.
//  Copyright © 2019 Gerardo Castillo Duran . All rights reserved.
//

import UIKit

var myIndex = 0

class MyEventsViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        performSegue(withIdentifier: "MyEventsDescription", sender: myIndex)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "MyEventsTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MyEventsTableViewCell else{
            fatalError("The dequeued cell is not an instance of TicketTableViewCell.")
        }
        cell.eventTitle.text = "Prueba"
        cell.eventImage.image = UIImage(named: "peopleBack")
        cell.accessoryType = .disclosureIndicator
        return cell
    }

}
