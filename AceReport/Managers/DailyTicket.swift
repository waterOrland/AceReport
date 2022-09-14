//
//  DailyTicket.swift
//  AceReport
//
//  Created by Orland Tompkins on 8/16/22.
//

import UIKit

struct DailyTicket {
    let ticketNumber: Int
    var isOpenTicket: Bool = false
    var isCloseTicket: Bool = false
    let createdAt: Date = Date()
    let totalCost: Double? = nil
    lazy var completedAt: Date? = nil
    lazy var timeDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter
    }()
    lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd YYYY"
        return dateFormatter
    }()
    var elapsedTime: String {
        let now = Date()
        let interval = DateInterval(start: createdAt, end: now)
            .duration // full syntax: interval.duration
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.day, .hour, .minute]
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: interval) ?? "Undetermined"
    }
    
    mutating func getArrival() -> String {
        return self.timeDateFormatter.string(from: createdAt)
    }
    
    mutating func getDeparture() -> String {
        return self.timeDateFormatter.string(from: Date())
    }
}
