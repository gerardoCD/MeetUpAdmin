//
//  MyEventsDescriptionViewController.swift
//  Meet Up Admin
//
//  Created by Abraham Quezada on 1/13/19.
//  Copyright © 2019 Gerardo Castillo Duran . All rights reserved.
//

import UIKit
import FirebaseDatabase
class MyEventsDescriptionViewController: UIViewController {
    
    @IBOutlet weak var scanButton: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgEvent: UIImageView!
    @IBOutlet weak var lblStartDate: UILabel!
    @IBOutlet weak var lblEndDate: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblSold: UILabel!
    var idEvent = ""
    var tickets = [String]()
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
        lblPrice.text = String(price)
        soldTickets(idEvent: idEvent) { (soldTickets) in
            self.lblSold.text = String(soldTickets)
        }
        scanButton.layer.cornerRadius = 8.0
        scanButton.layer.masksToBounds = true
    }
    
    
    func soldTickets(idEvent:String,completion: @escaping (_ soldTickets: Int) -> Void){
        loadEventsTickets(idEvent: idEvent) { (tickets) in
            let allTickets = tickets[0].count
            let restTickets = tickets[1].count
            completion(allTickets - restTickets)
        }
      
    }
    
    func loadEventsTickets(idEvent:String,completion: @escaping (_ events: [[String]]) -> Void){
        var ref: DatabaseReference!
        ref = Database.database().reference()
        ref.child("eventsTickets/\(idEvent)/").observeSingleEvent(of: .value, with: { (snapshot) in
            var events = [[String]]()
            let eventObject = snapshot.value as? [String: AnyObject]
            let eventAllTickets  = eventObject?["AllTickets"]
            let eventRemainingTickets = eventObject?["RemainingTickets"]
            events.append(eventAllTickets as! [String])
            events.append(eventRemainingTickets as! [String])
            completion(events)
        })
    
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is QRScanViewController
        {
           let vc = segue.destination as? QRScanViewController
            vc?.tickets = tickets
        }
    }
    
    @IBAction func btnScanQr(_ sender: UIButton) {
        performSegue(withIdentifier: "fromEventToQr", sender: nil)
        
    }
    
    
    
    
    
}
