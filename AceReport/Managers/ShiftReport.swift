//
//  ShiftReport.swift
//  AceReport
//
//  Created by Orland Tompkins
//

import UIKit

final class ShiftReport {
    var dailyTicket: [DailyTicket]
    
    init(_ dailyTicket: [DailyTicket]) {
        self.dailyTicket = dailyTicket
    }
    
    func addTicket(newTicket: DailyTicket) {
        self.dailyTicket.append(newTicket)
    }
}
