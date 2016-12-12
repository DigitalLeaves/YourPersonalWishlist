//
//  Person.swift
//  CustomPinsMap
//
//  Created by Ignacio Nieto Carvajal on 6/12/16.
//  Copyright © 2016 Ignacio Nieto Carvajal. All rights reserved.
//

import UIKit
import CoreLocation

class Person: NSObject {
    var name: String
    var avatar: UIImage
    var wishList =  [String]()
    var location: CLLocationCoordinate2D = kCLLocationCoordinate2DInvalid
    
    init(name: String, avatar: UIImage) {
        self.name = name
        self.avatar = avatar
    }
    
    func addItemToWishList(item: String) { wishList.append(item) }
    func removeItemFromWishList(item: String) {
        if let index = wishList.index(of: item) { wishList.remove(at: index) }
    }
    
    override var description: String { return "Name: \(name). WishList: [\(wishList.joined(separator: ", "))]" }
}
