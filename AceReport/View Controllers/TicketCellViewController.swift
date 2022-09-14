//
//  TicketCellViewController.swift
//  AceReport
//
//  Created by Orland Tompkins on 8/16/22.
//

import UIKit

class TicketCellViewController: UIViewController {
    @IBOutlet var selectedTicketLabel: UILabel!
    @IBOutlet var arrivalLabel: UILabel!
    @IBOutlet var departureLabel: UILabel!
    @IBOutlet var durationLabel: UILabel!
    @IBOutlet var costLabel: UILabel!
    
    var ticket: DailyTicket?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewSetup()
    }
    
    private func viewSetup() {
        guard let ticketNumber = ticket?.ticketNumber else { return }
        
        selectedTicketLabel.text = String(ticketNumber)
        arrivalLabel.text = ticket?.getArrival()
        departureLabel.text = ticket?.getDeparture()
        durationLabel.text = ticket?.elapsedTime
    }
    @IBAction func doneButton(_ sender: UIBarButtonItem) {
        ticket?.completedAt = Date()
        print(ticket?.completedAt)
    }
}
