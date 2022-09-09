//
//  LocationItem.swift
//  LetsEats
//
//  Created by Ricardo Roman Landeros on 29/08/22.
//

import Foundation

struct LocationItem {
    let city: String?
    let state: String?
    
}

extension LocationItem {
    init(dict: [String: String]){
        self.city = dict["city"]
        self.state = dict["state"]
    }
    
    var cityAndSate: String {
        guard let city = self.city, let state = self.state else {
            return ""
        }
        
        return "\(city) \(state)"
    }
}
