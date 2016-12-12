//
//  PersonWishListAnnotation.swift
//  CustomPinsMap
//
//  Created by Ignacio Nieto Carvajal on 6/12/16.
//  Copyright © 2016 Ignacio Nieto Carvajal. All rights reserved.
//

import UIKit
import MapKit

class PersonWishListAnnotation: NSObject, MKAnnotation {
    var person: Person
    var coordinate: CLLocationCoordinate2D { return person.location }
    
    init(person: Person) {
        self.person = person
        super.init()
    }
    
    var title: String? {
        return person.name
    }
    
    var subtitle: String? {
        return person.wishList.joined(separator: ", ")
    }
    
}
