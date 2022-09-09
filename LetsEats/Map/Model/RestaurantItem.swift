//
//  RestaurantItem.swift
//  LetsEats
//
//  Created by Ricardo Roman Landeros on 26/08/22.
//

import UIKit
import MapKit

enum CodingKeys: String, CodingKey {
    case name
    case cuisines
    case lat
    case long
    case address
    case postalCode = "postal_code"
    case state
    case imageURL = "image_url"
    case restaurantID = "id"
}

class RestaurantItem: NSObject, MKAnnotation, Decodable {

    let name: String?
    let cuisines: [String]
    let lat: Double?
    let long: Double?
    let address: String?
    let postalCode: String?
    let state: String?
    let imageURL: String?
    let restaurantID: Int?
    
//    init(dict: [String: AnyObject]){
//        self.lat = dict["lat"] as? Double
//        self.long = dict["log"] as? Double
//        self.name = dict["name"] as? String
//        self.cuisines = dict["cuisines"] as? [String] ?? []
//        self.address = dict["address"] as? String
//        self.postalCode = dict["postalCode"] as? String
//        self.state = dict["state"] as? String
//        self.imageURL = dict["image_url"] as? String
//        self.restaurantID = dict["id"] as? Int
//    }
    
    var coordinate: CLLocationCoordinate2D {
        guard let lat = self.lat, let long = self.long else {
            return CLLocationCoordinate2D()
        }
        
        return CLLocationCoordinate2D(latitude: lat, longitude: long)
    }
    
    //title es una propiedad calculada que devuelve el contenido de la namepropiedad.
    //estas son proppiedades del protocolo MKAnnotation
    var title: String? {
        self.name
    }
    
    var subtitle: String? {
        if self.cuisines.isEmpty {
            return ""
        } else if self.cuisines.count == 1 {
            return self.cuisines.first
        } else {
            return self.cuisines.joined(separator: ", ")
        }
    }
    
    
}
