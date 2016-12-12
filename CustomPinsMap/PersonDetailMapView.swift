//
//  PersonDetailMapView.swift
//  CustomPinsMap
//
//  Created by Ignacio Nieto Carvajal on 6/12/16.
//  Copyright © 2016 Ignacio Nieto Carvajal. All rights reserved.
//

import UIKit

protocol PersonDetailMapViewDelegate: class {
    func detailsRequestedForPerson(person: Person)
}

class PersonDetailMapView: UIView, UITableViewDelegate, UITableViewDataSource {
    // outlets
    @IBOutlet weak var backgroundContentButton: UIButton!
    @IBOutlet weak var personImageView: UIImageView!
    @IBOutlet weak var personName: UILabel!
    @IBOutlet weak var wishListTableView: UITableView!
    @IBOutlet weak var seeDetailsButton: UIButton!
    
    // data
    var person: Person!
    weak var delegate: PersonDetailMapViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // setup list
        wishListTableView.register(UINib(nibName: "PersonWishListItemTableViewCell", bundle: nil), forCellReuseIdentifier: "PersonWishListItemTableViewCell")
        wishListTableView.delegate = self
        wishListTableView.dataSource = self
    
        // appearance
        backgroundContentButton.applyArrowDialogAppearanceWithOrientation(arrowOrientation: .down)
    }
    
    @IBAction func seeDetails(_ sender: Any) {
        delegate?.detailsRequestedForPerson(person: person)
    }
    
    func configureWithPerson(person: Person) {
        self.person = person
        
        personImageView.image = person.avatar
        personName.text = person.name
        wishListTableView.reloadData()
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
    
    // MARK: - Hit test. We need to override this to detect hits in our custom callout.
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        // Check if it hit our annotation detail view components.

        // details button
        if let result = seeDetailsButton.hitTest(convert(point, to: seeDetailsButton), with: event) {
            return result
        }
        // list
        if let result = wishListTableView.hitTest(convert(point, to: wishListTableView), with: event) {
            return result
        }
        // fallback to our background content view
        return backgroundContentButton.hitTest(convert(point, to: backgroundContentButton), with: event)
    }
 
}
