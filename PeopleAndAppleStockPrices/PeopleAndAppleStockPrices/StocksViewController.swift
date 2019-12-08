//
//  StocksViewController.swift
//  PeopleAndAppleStockPrices
//
//  Created by Tsering Lama on 12/3/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class StocksViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var stocks = [Stocks]()
    
    var stockSections = [[Stocks]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        stocks = Stocks.getStocks()
        getSessions(of: stocks)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? DetailStocksViewController, let indexpath = tableView.indexPathForSelectedRow else {
            fatalError()
        }
        detailVC.stock = stockSections[indexpath.section][indexpath.row]
    }
    
    
    func getSessions(of data: [Stocks]) { // this should return // [[Stock]]
        
        let sortDate = data.sorted { $0.date < $1.date}
        var namesOfSection: Set<String> = Set(sortDate.map{$0.date})
        var removedLastDay = [String]()
        
        var sections: [[Stocks]]
        
        for stock in namesOfSection {
            var removedDashesStock = stock.components(separatedBy: "-")
            removedDashesStock.removeLast()
            removedLastDay.append(removedDashesStock.joined(separator: " "))
        }
        namesOfSection = Set(removedLastDay)
              
        let sectionNamesAsArr = Array(namesOfSection).sorted()
               
        
        sections = Array(repeating: [Stocks](), count: namesOfSection.count)

        var currentIndex = 0
        var sectionIndex = 0
        var currentSection = sectionNamesAsArr[sectionIndex]

        for stock in sortDate {
            var date = stock.date.components(separatedBy: "-")
            date.removeLast()
            let removedDayDate = date.joined(separator: " ")

            if removedDayDate == currentSection {
                sections[currentIndex].append(stock)

            } else {
                currentIndex += 1
                sectionIndex += 1
                currentSection = sectionNamesAsArr[sectionIndex]
                sections[currentIndex].append(stock)
            }

        }

        stockSections = sections
    }

    
}

extension StocksViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stockSections[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stockCell", for: indexPath)
        let stock = stocks[indexPath.row]
        cell.textLabel?.text = stock.date
        cell.detailTextLabel?.text = "$\(stock.open.description)"
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return stockSections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let stock1 = stockSections[section].first?.label.components(separatedBy: " ") else {return " " }
        let title = "\(stock1[0]) - \(stock1[2])"
        return title
    }
    
    
}
