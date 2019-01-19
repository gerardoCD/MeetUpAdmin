//
//  Event.swift
//  Meet Up Admin
//
//  Created by Gerardo Castillo Duran  on 1/14/19.
//  Copyright © 2019 Gerardo Castillo Duran . All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth

class Event {
    var id: String = ""
    var name: String = ""
    var description: String = ""
    var photo: UIImage? = nil
    var photoString: String? = nil
    var startDate:String = ""
    var endDate:String? = nil
    var map: String? = nil
    var startHour: String? = nil
    var endHour: String? = nil
    var cost: Double = 0.0
    var country: String? = nil
    var city: String? = nil
    var street: String? = nil
    var tickets: [String]? = nil
    
    init(id: String, name: String, description: String,photo:UIImage?,map:String?,startHour:String?,endHour:String,cost:Double,photoString:String?,tickets:[String]?,startDate:String,endDate:String?,country:String?,city:String?,street:String?) {
        self.id = id
        self.name = name
        self.description = description
        self.photo = photo
        self.photoString = photoString
        self.map = map
        self.endDate = endDate
        self.cost = cost
        self.tickets = tickets
        self.startDate = startDate
        self.endHour = endHour
        self.startHour = startHour
        self.country = country
        self.city = city
        self.street = street
    }
    
    static func saveEvent(City:String,Country:String,Description:String,EndDate:String,EndHour:String,ImageUrl:String,Place:String,Name:String,Price:Double,StartDate:String,StartHour:String,Street:String, completion: @escaping ((_ success:Bool,_ key:String)->())) {

        var  databaseRef = Database.database().reference().child("events")
        let key = databaseRef.childByAutoId().key!
        databaseRef =  Database.database().reference().child("events/\(key))")
        let userObject = [
            "City" : City,
            "Country" : Country,
            "Description" : Description,
            "EndDate" : EndDate,
            "EndHour" : EndHour,
            "Image" : ImageUrl,
            "Map" : Place,
            "Name" : Name,
            "Price" : Price,
            "StartDate" : StartDate,
            "StartHour" : StartHour,
            "Street" : Street
            ] as [String:Any]
        
        databaseRef.setValue(userObject) { error, ref in
            completion(error == nil,key)
        }
    }
    
    static func saveEventAdmin(City:String,Country:String,Description:String,EndDate:String,EndHour:String,ImageUrl:String,Place:String,Name:String,Price:Double,StartDate:String,StartHour:String,Street:String,key:String,Tickets:[String], completion: @escaping ((_ success:Bool)->())) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let databaseRef =  Database.database().reference().child("usersAdmin/profile/\(uid)/Events/\(key)")
        let userObject = [
            "City" : City,
            "Country" : Country,
            "Description" : Description,
            "EndDate" : EndDate,
            "EndHour" : EndHour,
            "Image" : ImageUrl,
            "Map" : Place,
            "Name" : Name,
            "Price" : Price,
            "StartDate" : StartDate,
            "StartHour" : StartHour,
            "Street" : Street,
            "tickest": Tickets
            ] as [String:Any]
        
        databaseRef.updateChildValues(userObject) { error, ref in
            completion(error == nil)
        }
    }
    
    static func saveEventTickets(key:String,Tickets:[String], completion: @escaping ((_ success:Bool)->())) {
        let databaseRef =  Database.database().reference().child("eventsTickets/\(key)")
        let userObject = [
            "AllTickets": Tickets,
            "RemainingTickets": Tickets
            ] as [String:Any]
        
        databaseRef.updateChildValues(userObject) { error, ref in
            completion(error == nil)
        }
    }
    
    
    
    
    
}

