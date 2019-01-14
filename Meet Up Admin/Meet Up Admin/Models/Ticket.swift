//
//  Ticket.swift
//  Meet Up Admin
//
//  Created by Gerardo Castillo Duran  on 1/14/19.
//  Copyright © 2019 Gerardo Castillo Duran . All rights reserved.
//

import Foundation
class Ticket{
    static func generateTickets(number: Int) -> [String]{
        var tickets = [String]()
        var  contador = 0
        while (contador < number){
            let numero = String(Int.random(in: 10000 ... 99999))
            if !tickets.contains(numero){
                tickets.append(numero)
                contador += 1
            }
        }
        return tickets
    }
}
