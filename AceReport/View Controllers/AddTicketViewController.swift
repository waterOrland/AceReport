//
//  ViewController.swift
//  AceReport
//
//  Created by Orland Tompkins on 8/16/22.
//

import UIKit

class AddTicketViewController: UITableViewController {
    let emptyLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    var ticket: DailyTicket? {
        willSet {
            emptyLabel.isHidden = true
        }
    }
    
    var dailyTickets: [DailyTicket] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewSetup()
    }
    
    private func viewSetup() {
        view.addSubview(emptyLabel)
        emptyLabel.text = "LIST EMPTY"
        emptyLabel.textColor = .lightGray
        emptyLabel.font = .italicSystemFont(ofSize: 16)
        emptyLabel.translatesAutoresizingMaskIntoConstraints = false
        emptyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emptyLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    @IBAction func addButton(_ sender: UIBarButtonItem) {
        ticketHandler()
        print("addButton pressed!")
    }
    
    private func ticketHandler() {
        guard dailyTickets.isEmpty else { return }
        
        let alert = UIAlertController(title: nil, message: "Enter Ticket Number", preferredStyle: .alert)
        alert.addTextField { field in
            field.placeholder = "Opening Ticket"
            field.keyboardType = .numberPad
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: { [self] _ in
            guard let openingTicket = alert.textFields else { return }
            
            if let openingTicket = openingTicket[0].text, !openingTicket.isEmpty {
               ticket = DailyTicket(ticketNumber: Int(openingTicket), createdAt: Date(), completedAt: nil, totalStayed: nil, totalCost: nil)
                
                dailyTickets.append(ticket!)
            }
        }))
        
        present(alert, animated: true)
    }
    
    @IBAction func monthlyButton(_ sender: UIBarButtonItem) {
        test()
        print("monthlyButton pressed!")
    }
    
    private func test() {
        print(ticket)
    }
}

