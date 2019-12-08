//
//  AppleStock.swift
//  PeopleAndAppleStockPrices
//
//  Created by Tsering Lama on 12/3/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct Stocks: Codable {
    
    let date: String
    let open: Double
    let close: Double
    let change: Double
    let label: String

}

extension Stocks {
    
    static func getStocks() -> [Stocks] {
        var stocks = [Stocks]()
        
        guard let fileURL = Bundle.main.url(forResource: "applstockinfo", withExtension: "json") else {
            fatalError()
        }
        
        do {
            let data = try Data(contentsOf: fileURL)
            let stocksData = try JSONDecoder().decode([Stocks].self, from: data)
            stocks = stocksData
        } catch {
            fatalError()
        }

        return stocks
    }
}
