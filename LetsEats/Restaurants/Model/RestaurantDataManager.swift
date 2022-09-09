//
//  RestaurantDataManager.swift
//  LetsEats
//
//  Created by Ricardo Roman Landeros on 29/08/22.
//

import Foundation

class RestaurantDataManager {
    
    private var restaurantItems: [RestaurantItem] = []
    
    func fetch(location: String, selectedCuisine: String = "All", completionHandler: (_ restaurantItems: [RestaurantItem]) -> Void){
        if let file = Bundle.main.url(forResource: location, withExtension: "json"){
            do {
                let data = try Data(contentsOf: file)
                let restaurants = try JSONDecoder().decode([RestaurantItem].self, from: data)
                if selectedCuisine != "All" {
                    restaurantItems = restaurants.filter({ item in
                        item.cuisines.contains(selectedCuisine)
                    })
                } else {
                    restaurantItems = restaurants
                }
            } catch {
                print("Este es un error \(error)")
            }
        }
        
        completionHandler(restaurantItems)
    }
    
    func numberOfRestaiurantItems() -> Int {
        restaurantItems.count
    }
    
    func restaurantItem(at index: Int) -> RestaurantItem {
        restaurantItems[index]
    }
}
