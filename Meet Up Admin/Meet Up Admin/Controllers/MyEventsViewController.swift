//
//  MyEventsViewController.swift
//  Meet Up Admin
//
//  Created by Abraham Quezada on 1/11/19.
//  Copyright © 2019 Gerardo Castillo Duran . All rights reserved.
//

import UIKit
import FirebaseAuth
var myIndex = 0

class MyEventsViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    
    var events = [EventAdmin]()
    override func viewDidLoad() {
        super.viewDidLoad()
        if Auth.auth().currentUser != nil {
            loadDatas()
        } else {
            events = []
            tableView.reloadData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if Auth.auth().currentUser != nil {
            loadDatas()
        } else {
            events = []
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        performSegue(withIdentifier: "MyEventsDescription", sender: myIndex)
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "MyEventsTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MyEventsTableViewCell else{
            fatalError("The dequeued cell is not an instance of TicketTableViewCell.")
        }
        cell.eventTitle.text = events[indexPath.row].name
        DispatchQueue.main.async {
            let url = URL(string:  self.events[indexPath.row].photoString!)
            let data = try? Data(contentsOf: url!)
            let image  = UIImage(data: data!)
            self.events[indexPath.row].photo = image
            cell.eventImage.image = image
        }
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    
    
    func loadDatas(){
        EventAdmin.loadTickets2 { (eventsIn) in
            self.events = eventsIn
            self.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is MyEventsDescriptionViewController
        {
           let vc = segue.destination as? MyEventsDescriptionViewController
            vc?.title2 = events[sender as! Int].name
            vc?.startDate = events[sender as! Int].startDate!
            vc?.endDate = events[sender as! Int].endDate!
            vc?.img = events[sender as! Int].photo!
            vc?.price = events[sender as! Int].cost
            vc?.idEvent = events[sender as! Int].id
            vc?.tickets = events[sender as! Int].tickets!
        }
    }

}
