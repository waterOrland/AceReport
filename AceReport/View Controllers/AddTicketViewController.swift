//
//  ViewController.swift
//  AceReport
//
//  Created by Orland Tompkins.
//

import UIKit

protocol RetrieveDataDelegate {
    func getDateCompleted(date: Date)
}

class AddTicketViewController: UITableViewController {
    private enum Segue {
        static let TicketCellViewController = "TicketCellViewController"
    }
    
    let emptyLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    var ticket: DailyTicket? {
        willSet {
            emptyLabel.isHidden = true
        }
    }
    
    var selectedRow: Int?
    var dailyTickets: [DailyTicket] = []

    // MARK: - viewDidLoad()
    
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

    // MARK: -
    
    @IBAction func addButton(_ sender: UIBarButtonItem) {
        ticketHandler()
    }
    
    private func ticketHandler() {
        guard dailyTickets.isEmpty else {
            if let newTicket = dailyTickets.last?.ticketNumber {
                ticket = DailyTicket(ticketNumber: newTicket + 1)
                dailyTickets.append(ticket!)
            }
            tableView.reloadData()
            return
        }
        
        let alert = UIAlertController(title: nil, message: "Enter Ticket Number", preferredStyle: .alert)
        alert.addTextField { field in
            field.placeholder = "Opening Ticket"
            field.keyboardType = .numberPad
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: { [self] _ in
            guard let openingTicket = alert.textFields else { return }
            
            if let openingTicket = openingTicket[0].text, !openingTicket.isEmpty {
                ticket = DailyTicket(ticketNumber: Int(openingTicket)!)
                ticket?.isOpenTicket = true
                dailyTickets.append(ticket!)
            }
            tableView.reloadData()
        }))
        present(alert, animated: true)
    }
    
    @IBAction func monthlyButton(_ sender: UIBarButtonItem) {
        test()
    }
    
    // MARK: - Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        
        switch (identifier) {
            case Segue.TicketCellViewController:
                guard let destination = segue.destination as? TicketCellViewController else { return }
                guard let index = tableView.indexPathForSelectedRow?.row else { return }
                selectedRow = index
                destination.delegate = self
                destination.ticket = dailyTickets[index]
            default:
                break
        }
    }
    
    // MARK: - TableView
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dailyTickets.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TicketTableViewCell.reusableIdentifer, for: indexPath) as? TicketTableViewCell else {
            fatalError("Unexpected Index Path")
        }
        cell.ticketLabel.text = String(dailyTickets[indexPath.row].ticketNumber)
        cell.arrival.text = dailyTickets[indexPath.row].getArrival()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    // MARK: - TEST
    
    private func test() {
        
    }
}

extension AddTicketViewController: RetrieveDataDelegate {
    func getDateCompleted(date: Date) {
        if let index = selectedRow {
            dailyTickets[index].completedAt = date
        }
    }
}
