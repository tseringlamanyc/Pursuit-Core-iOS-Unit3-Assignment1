//
//  ViewController.swift
//  PeopleAndAppleStockPrices
//
//  Created by Alex Paul on 12/7/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class PeopleViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var peopleSearch: UISearchBar!
    
    var users = [UserInfo]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    var currentSearch = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        peopleSearch.delegate = self
        users = UserData.getUsers()
    }
    
    func searchPeople() {
        users = UserData.getUsers().filter {$0.fullName.lowercased().contains(currentSearch.lowercased())}
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? DetailPeopleViewController, let indexpath = tableView.indexPathForSelectedRow else {
            return
        }
        detailVC.user = users[indexpath.row]
    }
}

extension PeopleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "peopleCell", for: indexPath)
        let userData = users[indexPath.row]
        let fullname = "\(userData.name.first) \(userData.name.last)"
        cell.textLabel?.text = fullname.capitalized
        cell.detailTextLabel?.text = userData.location.city.capitalized
        return cell
    }
}

extension PeopleViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            users = UserData.getUsers()
            return
        }
        currentSearch = searchText
        searchPeople()
    }
}

