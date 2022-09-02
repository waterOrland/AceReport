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
        test()
        
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
        guard !dailyTickets.isEmpty else { return }
        
        print("dailyTicket has contents")
    }
    
    @IBAction func monthlyButton(_ sender: UIBarButtonItem) {
        print("monthlyButton pressed!")
    }
    
    private func test() {
//        print(ticket)
    }
}

