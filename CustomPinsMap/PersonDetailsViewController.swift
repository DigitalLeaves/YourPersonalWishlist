//
//  PersonDetailsViewController.swift
//  CustomPinsMap
//
//  Created by Ignacio Nieto Carvajal on 8/12/16.
//  Copyright © 2016 Ignacio Nieto Carvajal. All rights reserved.
//

import UIKit

class PersonDetailsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    // outlets
    @IBOutlet weak var personAvatarImageView: UIImageView!
    @IBOutlet weak var personNameLabel: UILabel!
    @IBOutlet weak var wishListTableView: UITableView!
    @IBOutlet weak var backButton: UIButton!
    
    // data
    var person: Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // setup list
        wishListTableView.register(UINib(nibName: "PersonWishListItemTableViewCell", bundle: nil), forCellReuseIdentifier: "PersonWishListItemTableViewCell")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if person != nil {
            personAvatarImageView.image = person!.avatar
            personNameLabel.text = person!.name
            wishListTableView.reloadData()
        }
    }

    @IBAction func goBack(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }

    // MARK: - UITableViewDelegate/DataSource methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return person?.wishList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonWishListItemTableViewCell", for: indexPath) as! PersonWishListItemTableViewCell
        
        if let item = person?.wishList[indexPath.row] { cell.configureWithItem(item: item) }
        
        return cell
    }
    
}
