//
//  ViewController.swift
//  CustomPinsMap
//
//  Created by Ignacio Nieto Carvajal on 6/12/16.
//  Copyright © 2016 Ignacio Nieto Carvajal. All rights reserved.
//

import UIKit
import MapKit

private let kPersonWishListAnnotationName = "kPersonWishListAnnotationName"

class ViewController: UIViewController, MKMapViewDelegate, PersonDetailMapViewDelegate {
    // outlets
    @IBOutlet weak var mapView: MKMapView!
    
    // data
    var selectedPerson: Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configurePeopleInMap()
        setFakeUserPosition()
    }
    
    func configurePeopleInMap() {
        var annotations = [MKAnnotation]()
        for person in PeopleWishListManager.sharedInstance.people {
            let annotation = PersonWishListAnnotation(person: person)
            annotations.append(annotation)
        }
        mapView.removeAnnotations(mapView.annotations)
        mapView.addAnnotations(annotations)
    }

    func setFakeUserPosition() {
        let visibleRegion = MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2D(latitude: 47.57983, longitude: -52.68997), 10000, 10000)
        self.mapView.setRegion(self.mapView.regionThatFits(visibleRegion), animated: true)
    }
    
    // MARK: - MKMapViewDelegate methods
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        let visibleRegion = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 10000, 10000)
        self.mapView.setRegion(self.mapView.regionThatFits(visibleRegion), animated: true)
    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation { return nil }
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: kPersonWishListAnnotationName)
        
        if annotationView == nil {
            annotationView = PersonWishListAnnotationView(annotation: annotation, reuseIdentifier: kPersonWishListAnnotationName)
            (annotationView as! PersonWishListAnnotationView).personDetailDelegate = self
        } else {
            annotationView!.annotation = annotation
        }
        
        return annotationView
        
    }
    
    // MARK: - Selecting a person and seguing to details
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let pdvc = segue.destination as? PersonDetailsViewController {
            pdvc.person = self.selectedPerson
        }
    }
    
    func detailsRequestedForPerson(person: Person) {
        self.selectedPerson = person
        self.performSegue(withIdentifier: "personDetails", sender: nil)
    }
}

