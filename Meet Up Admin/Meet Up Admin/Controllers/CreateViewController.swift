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
        createButton.isUserInteractionEnabled = false
        createButton.alpha = 0.5
        }
    
    
    @IBAction func titleEvent(_ sender: UITextField) {
        if(txtStartDate.text?.isEmpty == false) && (txtEndDate.text?.isEmpty == false) && (txtCountry.text?.isEmpty == false) && (txtCity.text?.isEmpty == false) && (txtStreet.text?.isEmpty == false) && (txtPrice.text?.isEmpty == false) && (txtAvailableTickets.text?.isEmpty == false) && (txtStartTime.text?.isEmpty == false) && (txtEndTime.text?.isEmpty == false) && (txtDescription.text?.isEmpty == false){
            if sender.text?.isEmpty == true{
                buttonDisabled()
            }else{
                buttonEnabled()
            }
        }
    }
    @IBAction func startDate(_ sender: UITextField) {
        if(txtEventTitle.text?.isEmpty == false) && (txtEndDate.text?.isEmpty == false) && (txtCountry.text?.isEmpty == false) && (txtCity.text?.isEmpty == false) && (txtStreet.text?.isEmpty == false) && (txtPrice.text?.isEmpty == false) && (txtAvailableTickets.text?.isEmpty == false) && (txtStartTime.text?.isEmpty == false) && (txtEndTime.text?.isEmpty == false) && (txtDescription.text?.isEmpty == false){
            if sender.text?.isEmpty == true{
                buttonDisabled()
            }else{
                buttonEnabled()
            }
        }
    }
    @IBAction func endDate(_ sender: UITextField) {
        if(txtEventTitle.text?.isEmpty == false) && (txtStartDate.text?.isEmpty == false) && (txtCountry.text?.isEmpty == false) && (txtCity.text?.isEmpty == false) && (txtStreet.text?.isEmpty == false) && (txtPrice.text?.isEmpty == false) && (txtAvailableTickets.text?.isEmpty == false) && (txtStartTime.text?.isEmpty == false) && (txtEndTime.text?.isEmpty == false) && (txtDescription.text?.isEmpty == false){
            if sender.text?.isEmpty == true{
                buttonDisabled()
            }else{
                buttonEnabled()
            }
        }
    }
    @IBAction func countryChanged(_ sender: UITextField) {
        if(txtEventTitle.text?.isEmpty == false) && (txtStartDate.text?.isEmpty == false) && (txtEndDate.text?.isEmpty == false) && (txtCity.text?.isEmpty == false) && (txtStreet.text?.isEmpty == false) && (txtPrice.text?.isEmpty == false) && (txtAvailableTickets.text?.isEmpty == false) && (txtStartTime.text?.isEmpty == false) && (txtEndTime.text?.isEmpty == false) && (txtDescription.text?.isEmpty == false){
            if sender.text?.isEmpty == true{
                buttonDisabled()
            }else{
                buttonEnabled()
            }
        }
    }
    @IBAction func cityChanged(_ sender: UITextField) {
        if(txtEventTitle.text?.isEmpty == false) && (txtStartDate.text?.isEmpty == false) && (txtEndDate.text?.isEmpty == false) && (txtCountry.text?.isEmpty == false) && (txtStreet.text?.isEmpty == false) && (txtPrice.text?.isEmpty == false) && (txtAvailableTickets.text?.isEmpty == false) && (txtStartTime.text?.isEmpty == false) && (txtEndTime.text?.isEmpty == false) && (txtDescription.text?.isEmpty == false){
            if sender.text?.isEmpty == true{
                buttonDisabled()
            }else{
                buttonEnabled()
            }
        }
    }
    @IBAction func streetChanged(_ sender: UITextField) {
        if(txtEventTitle.text?.isEmpty == false) && (txtStartDate.text?.isEmpty == false) && (txtEndDate.text?.isEmpty == false) && (txtCountry.text?.isEmpty == false) && (txtCity.text?.isEmpty == false) && (txtPrice.text?.isEmpty == false) && (txtAvailableTickets.text?.isEmpty == false) && (txtStartTime.text?.isEmpty == false) && (txtEndTime.text?.isEmpty == false) && (txtDescription.text?.isEmpty == false){
            if sender.text?.isEmpty == true{
                buttonDisabled()
            }else{
                buttonEnabled()
            }
        }
    }
    @IBAction func priceChanged(_ sender: UITextField) {
        if(txtEventTitle.text?.isEmpty == false) && (txtStartDate.text?.isEmpty == false) && (txtEndDate.text?.isEmpty == false) && (txtCountry.text?.isEmpty == false) && (txtCity.text?.isEmpty == false) && (txtStreet.text?.isEmpty == false) && (txtAvailableTickets.text?.isEmpty == false) && (txtStartTime.text?.isEmpty == false) && (txtEndTime.text?.isEmpty == false) && (txtDescription.text?.isEmpty == false){
            if sender.text?.isEmpty == true{
                buttonDisabled()
            }else{
                buttonEnabled()
            }
        }
    }
    @IBAction func ticketsChanged(_ sender: UITextField) {
        if(txtEventTitle.text?.isEmpty == false) && (txtStartDate.text?.isEmpty == false) && (txtEndDate.text?.isEmpty == false) && (txtCountry.text?.isEmpty == false) && (txtCity.text?.isEmpty == false) && (txtStreet.text?.isEmpty == false) && (txtPrice.text?.isEmpty == false) && (txtStartTime.text?.isEmpty == false) && (txtEndTime.text?.isEmpty == false) && (txtDescription.text?.isEmpty == false){
            if sender.text?.isEmpty == true{
                buttonDisabled()
            }else{
                buttonEnabled()
            }
        }
    }
    @IBAction func startTimeChanged(_ sender: UITextField) {
        if(txtEventTitle.text?.isEmpty == false) && (txtStartDate.text?.isEmpty == false) && (txtEndDate.text?.isEmpty == false) && (txtCountry.text?.isEmpty == false) && (txtCity.text?.isEmpty == false) && (txtStreet.text?.isEmpty == false) && (txtPrice.text?.isEmpty == false) && (txtAvailableTickets.text?.isEmpty == false) && (txtEndTime.text?.isEmpty == false) && (txtDescription.text?.isEmpty == false){
            if sender.text?.isEmpty == true{
                buttonDisabled()
            }else{
                buttonEnabled()
            }
        }
    }
    @IBAction func endTimeChanged(_ sender: UITextField) {
        if(txtEventTitle.text?.isEmpty == false) && (txtStartDate.text?.isEmpty == false) && (txtEndDate.text?.isEmpty == false) && (txtCountry.text?.isEmpty == false) && (txtCity.text?.isEmpty == false) && (txtStreet.text?.isEmpty == false) && (txtPrice.text?.isEmpty == false) && (txtAvailableTickets.text?.isEmpty == false) && (txtStartTime.text?.isEmpty == false) && (txtDescription.text?.isEmpty == false){
            if sender.text?.isEmpty == true{
                buttonDisabled()
            }else{
                buttonEnabled()
            }
        }
    }
    @IBAction func descriptionChanged(_ sender: UITextField) {
        if(txtEventTitle.text?.isEmpty == false) && (txtStartDate.text?.isEmpty == false) && (txtEndDate.text?.isEmpty == false) && (txtCountry.text?.isEmpty == false) && (txtCity.text?.isEmpty == false) && (txtStreet.text?.isEmpty == false) && (txtPrice.text?.isEmpty == false) && (txtAvailableTickets.text?.isEmpty == false) && (txtStartTime.text?.isEmpty == false) && (txtEndTime.text?.isEmpty == false){
            if sender.text?.isEmpty == true{
                buttonDisabled()
            }else{
                buttonEnabled()
            }
        }
    }
    
    func buttonDisabled(){
        createButton.isUserInteractionEnabled = false
        createButton.alpha = 0.5
    }
    
    func buttonEnabled(){
        createButton.isUserInteractionEnabled = true
        createButton.alpha = 1.0
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
