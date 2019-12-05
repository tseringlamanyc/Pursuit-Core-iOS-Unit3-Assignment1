//
//  ImageClient.swift
//  PeopleAndAppleStockPrices
//
//  Created by Tsering Lama on 12/5/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

struct ImageCLient {
    static func getImage (urlString: String, completion: @escaping (Result<UIImage?, Error>) -> ()) {
        guard let url = URL(string: urlString) else {
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("\(error)")
            }
            if let data = data {
                let image = UIImage(data: data)
                completion(.success(image))
            }
        }
        dataTask.resume()
    }
}
