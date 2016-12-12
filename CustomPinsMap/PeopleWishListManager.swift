//
//  PeopleWishListManager.swift
//  CustomPinsMap
//
//  Created by Ignacio Nieto Carvajal on 6/12/16.
//  Copyright © 2016 Ignacio Nieto Carvajal. All rights reserved.
//

import UIKit
import CoreLocation

// quick singleton implementation for our PeopleWishListManager.
private let _singletonInstance = PeopleWishListManager()

private let kPeopleWishListManagerNumberOfPeople = 21

class PeopleWishListManager: NSObject {
    // shared instance of PeopleWishListManager.
    class var sharedInstance: PeopleWishListManager { return _singletonInstance }
    
    // people wishlist
    var people = [Person]()
    
    // MARK: - init
    override init() {
        super.init()
        populatePeopleList()
    }

    func populatePeopleList() {
        let names = ["Oren Nimmons", "Flor Addington", "Bernadette Bachus", "Candida Leep", "Diann Tribble", "Joanna Christie", "Kaycee Lamark", "Melida Ro", "Eleonora Aguon", "Eryn Donald", "Cheyenne Zarate", "Carolann Power", "Kip Rooks", "Heda Wong", "Deandrea Sitsler", "Nathan Mccorkle", "Ralph Gump", "Trang Sandstrom", "Margareta Whitting", "Jazmin Robertson", "Natalia Gómez"]
        
        let coordinates = [
            CLLocationCoordinate2D(latitude: 47.57273, longitude: -52.68997),
            CLLocationCoordinate2D(latitude: 47.56624, longitude: -52.71184),
            CLLocationCoordinate2D(latitude: 47.57983, longitude: -52.73261),
            CLLocationCoordinate2D(latitude: 44.63778, longitude: -63.56583),
            CLLocationCoordinate2D(latitude: 43.6625, longitude: -70.245),
            CLLocationCoordinate2D(latitude: 42.24403, longitude: -70.96989),
            CLLocationCoordinate2D(latitude: 41.70569, longitude: -71.16307),
            CLLocationCoordinate2D(latitude: 41.70607, longitude: -71.16292),
            CLLocationCoordinate2D(latitude: 43.08238, longitude: -70.76674),
            CLLocationCoordinate2D(latitude: 41.46498, longitude: -71.30465),
            CLLocationCoordinate2D(latitude: 42.35871, longitude: -71.05783),
            CLLocationCoordinate2D(latitude: 42.37218, longitude: -71.05447),
            CLLocationCoordinate2D(latitude: 42.35806, longitude: -71.06222),
            CLLocationCoordinate2D(latitude: 42.33917, longitude: -71.09417),
            CLLocationCoordinate2D(latitude: 41.3625, longitude: -71.96528),
            CLLocationCoordinate2D(latitude: 41.76351, longitude: -72.67342),
            CLLocationCoordinate2D(latitude: 40.9063, longitude: -73.3691),
            CLLocationCoordinate2D(latitude: 42.70778, longitude: -73.21361),
            CLLocationCoordinate2D(latitude: 40.86235, longitude: -73.87666),
            CLLocationCoordinate2D(latitude: 40.7765, longitude: -73.9435),
            CLLocationCoordinate2D(latitude: 40.8674, longitude: -73.9233),
        ]
        
        people = []
        for i in 0..<kPeopleWishListManagerNumberOfPeople {
            let wishlist = giveMeAWishList()
            let name = names[i]
            let avatar = UIImage(named: "avatar\(i+1)")!
            
            let person = Person(name: name, avatar: avatar)
            person.wishList = wishlist
            person.location = coordinates[i]
            people.append(person)
        }
    }
    
    func giveMeAWishList() -> [String] {
        let items = ["Remote control", "Soda", "Barbie doll", "Watch", "Purple pen", "Dollar Bill", "stuffed animal", "Hair clip", "Sun glasses", "T shirt", "Purse", "Towel", "Hat", "Camera", "Hand sanitizer bottle", "Porcelian Budda", "Photo", "dog bone", "Hair brush", "Birthday card", "socks", "shoes", "stuffed monkey", "bag of chips", "ELEPHANT", "snapple", "tweezers", "laptop", "lemon", "apple", "mango", "watermelon", "daisy dukes", "basset hound/labrador", "video casette", "candy bar", "yourself", "radio", "keys", "eggs", "duck", "bottle of perfume"]
    
        let num = arc4random_uniform(3) + 1
        var wishlist = [String]()
        for _ in 0..<num {
            let index = Int(arc4random_uniform(UInt32(items.count)))
            wishlist.append(items[index])
        }
        return wishlist
    }
}
