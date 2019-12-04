//
//  DetailPeopleViewController.swift
//  PeopleAndAppleStockPrices
//
//  Created by Tsering Lama on 12/3/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class DetailPeopleViewController: UIViewController {
    
    
    @IBOutlet weak var peopleImage: UIImageView!
    @IBOutlet weak var nameText: UILabel!
    @IBOutlet weak var emailText: UILabel!
    @IBOutlet weak var cityText: UILabel!
    

    var user: UserInfo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        peopleImage.image = #imageLiteral(resourceName: "profileImage")
        nameText.text = "\(user.name.first) \(user.name.last)".capitalized
        emailText.text = user.email
        cityText.text = user.location.state.capitalized
    }
    

    
}
