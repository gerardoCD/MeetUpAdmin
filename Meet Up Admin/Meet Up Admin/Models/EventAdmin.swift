//
//  EventAdmin.swift
//  Meet Up Admin
//
//  Created by Gerardo Castillo Duran  on 1/20/19.
//  Copyright © 2019 Gerardo Castillo Duran . All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseDatabase

class EventAdmin {
    var id: String = ""
    var name: String = ""
    var photo: UIImage? = nil
    var photoString: String? = nil
    var startDate:String? = ""
    var endDate:String? = nil
    var cost: Double = 0.0
    var availableTickets: [String]? = nil

    var tickets: [String]? = nil
    
    init(id: String, name: String,photo:UIImage?,cost:Double,photoString:String?,tickets:[String]?,startDate:String,endDate:String?,availableTickets:[String]?) {
        self.id = id
        self.name = name
        self.photo = photo
        self.photoString = photoString
        self.endDate = endDate
        self.cost = cost
        self.tickets = tickets
        self.startDate = startDate
}
    
    static func loadTickets2(completion: @escaping (_ events: [EventAdmin]) -> Void){
        guard let uid = Auth.auth().currentUser?.uid else {return}
        var ref: DatabaseReference!
        ref = Database.database().reference()
        print(uid)
        ref.child("usersAdmin/profile/\(uid)/events").observeSingleEvent(of: .value, with: { (snapshot) in
            var events = [EventAdmin]()
            for event in snapshot.children.allObjects as! [DataSnapshot] {
                let eventObject = event.value as? [String: AnyObject]
                let evenId = event.key
                let eventName  = eventObject?["Name"]
                let eventImageString = eventObject?["Image"]
                let evenStartDate = eventObject?["StartDate"]
                let eventEndDate = eventObject?["EndDate"]
                let eventCost = eventObject?["Price"]
                let eventTickets = eventObject?["tickets"]
                let evento = EventAdmin(id: evenId, name: eventName as! String, photo: nil, cost: eventCost as! Double, photoString: eventImageString as? String, tickets: eventTickets as? [String], startDate: evenStartDate as! String, endDate: eventEndDate as? String, availableTickets: nil)
                            events.append(evento)
                        }
                        print(events)
                        completion(events)
        })
        
    }
    
    
    

}
