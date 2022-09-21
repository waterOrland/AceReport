//
//  TicketCellViewController.swift
//  AceReport
//
//  Created by Orland Tompkins on 8/16/22.
//
// TODO: - Implement protocol to pass value to prev VC -- createdAt

import UIKit

class TicketCellViewController: UIViewController {
    @IBOutlet var selectedTicketLabel: UILabel!
    @IBOutlet var arrivalLabel: UILabel!
    @IBOutlet var departureLabel: UILabel!
    @IBOutlet var durationLabel: UILabel!
    @IBOutlet var costLabel: UILabel!
    
    var delegate: RetrieveDataDelegate?
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
        delegate?.completionDate = Date()
        print(delegate?.completionDate)
    }
}
