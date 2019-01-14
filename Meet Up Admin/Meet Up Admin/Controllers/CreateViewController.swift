//
//  CreateViewController.swift
//  Meet Up Admin
//
//  Created by Abraham Quezada on 1/10/19.
//  Copyright © 2019 Gerardo Castillo Duran . All rights reserved.
//

import UIKit
import FirebaseAuth

class CreateViewController: UIViewController {
    
    
    @IBOutlet weak var createButton: UIButton!
    @IBOutlet weak var txtEventTitle: UITextField!
    @IBOutlet weak var imgEvent: UIImageView!
    @IBOutlet weak var txtStartDate: UITextField!
    @IBOutlet weak var txtEndDate: UITextField!
    @IBOutlet weak var txtCountry: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtStreet: UITextField!
    @IBOutlet weak var txtPrice: UITextField!
    @IBOutlet weak var txtAvailableTickets: UITextField!
    @IBOutlet weak var txtStartTime: UITextField!
    @IBOutlet weak var txtEndTime: UITextField!
    @IBOutlet weak var txtDescription: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createButton.layer.cornerRadius = 8.0
        createButton.layer.masksToBounds = true
        }
    
    
    @IBAction func CreateEvent(_ sender: UIButton) {
       if Auth.auth().currentUser != nil {
        Event.saveEvent(City: "s", Country: "a", Description: "a", EndDate: "a", EndHour: "2", ImageUrl: "2ww1", Place: "ss", Name: "dwed", Price: "wzw", StartDate: "wwxw", StartHour: "ededed", Street: "ededed") { (succes,key)  in
                if succes {
                    let tickets = Ticket.generateTickets(number: Int(self.txtAvailableTickets.text!)!)
                    Event.saveEventAdmin(City: "s", Country: "a", Description: "a", EndDate: "a", EndHour: "2", ImageUrl: "2ww1", Place: "ss", Name: "dwed", Price: "wzw", StartDate: "wwxw", StartHour: "ededed", Street: "ededed", key: key, Tickets: tickets, completion: { (sucess2) in
                        if sucess2{
                            Event.saveEventTickets(key: key, Tickets: tickets, completion: { (sucess3) in
                                if sucess3{
                                    print("Ya chingamos")
                                }
                            })
                        }else{
                            print("Error eventosAdmin")
                        }
                    })
                }else{
                    print("ErrorEventos")
                }
            }
            
        }else{
            
            performSegue(withIdentifier: "eventToLog", sender: nil)
            
        }
    }
    
    

    
    
    
}
