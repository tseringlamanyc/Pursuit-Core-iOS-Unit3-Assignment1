//
//  DetailStocksViewController.swift
//  PeopleAndAppleStockPrices
//
//  Created by Tsering Lama on 12/3/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class DetailStocksViewController: UIViewController {
    
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var openLabel: UILabel!
    @IBOutlet weak var closeLabel: UILabel!
    
    var stock: Stocks!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateLabel.text = stock.date
        openLabel.text = "Open: $\(stock.open.description)"
        closeLabel.text = "Close: $\(stock.close.description)"
        changeImageAndBackground()
    }
    
    func changeImageAndBackground() {
        if stock.change < 0 {
            imageView.image = #imageLiteral(resourceName: "thumbsDown")
            view.backgroundColor = .red
        } else {
            imageView.image = #imageLiteral(resourceName: "thumbsUp")
            view.backgroundColor = .green
        }
    }
    


}
