//
//  DailyTicket.swift
//  AceReport
//
//  Created by Orland Tompkins on 8/16/22.
//

import Foundation

struct DailyTicket {
    enum TicketType {
        case isDaily
    }
    
    let ticketNumber: Int?
    var isOpenTicket: Bool = false
    var isCloseTicket: Bool = false
    let arrival: Date?
    let departure: Date?
    let totalStayed: DateInterval?
    let totalCost: Int?
    var isDone: Bool = false
    
    func getTotalStayed() {}
    func getTotalCost() {}
}
