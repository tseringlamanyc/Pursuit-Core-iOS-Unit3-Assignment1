//
//  UserInfo.swift
//  PeopleAndAppleStockPrices
//
//  Created by Tsering Lama on 12/3/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct UserData: Decodable {
    
    let results: [UserInfo]
}

struct UserInfo: Decodable {
    let name: Name
    let email: String
    let location: Location
}

struct Name: Decodable {
    let title: String
    let first: String
    let last: String
}

struct Location: Decodable {
    let city: String
    let state: String
}

extension UserData {
    
    static func getUsers() -> [UserInfo] {
        var users = [UserInfo]()
        
        guard let fileURL = Bundle.main.url(forResource: "userinfo", withExtension: "json") else {
            fatalError()
        }
        
        do {
            let data = try Data(contentsOf: fileURL)
            let userdata = try JSONDecoder().decode(UserData.self, from: data)
            users = userdata.results.sorted {$0.name.first < $1.name.first}
        } catch {
            fatalError()
        }
        
        return users
    }
}

