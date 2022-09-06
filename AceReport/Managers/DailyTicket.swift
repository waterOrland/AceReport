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
        case isComplete
    }
    
    let ticketNumber: Int
    var isOpenTicket: Bool = false
    var isCloseTicket: Bool = false
    let createdAt: Date = Date()
    let totalCost: Double? = nil
    lazy var completedAt: Date? = nil
    
    func elapsedTime() -> TimeInterval {
        return Date().timeIntervalSince(createdAt)
    }
}
