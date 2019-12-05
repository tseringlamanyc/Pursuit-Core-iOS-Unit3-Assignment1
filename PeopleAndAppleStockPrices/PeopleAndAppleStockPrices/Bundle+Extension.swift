//
//  Bundle+Extension.swift
//  PeopleAndAppleStockPrices
//
//  Created by Tsering Lama on 12/5/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

extension Bundle {
    
    static func parseJSONData(filename: String, ext: String) -> Data {
        
        guard let fileURL = Bundle.main.url(forResource: filename, withExtension: ext) else {
            fatalError("error")
        }
        var data: Data!
        do {
            data = try Data.init(contentsOf: fileURL)
        } catch {
            fatalError("\(error)")
        }
        return data
    }
}
