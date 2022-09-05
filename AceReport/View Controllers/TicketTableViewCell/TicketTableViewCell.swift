//
//  TicketTableViewCell.swift
//  AceReport
//
//  Created by Orland Tompkins on 9/5/22.
//

import UIKit

class TicketTableViewCell: UITableViewCell {
    static let reusableIdentifer = "TicketTableViewCell"
    
    @IBOutlet var ticketLabel: UILabel!
    @IBOutlet var arrival: UILabel!
}
