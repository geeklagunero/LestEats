//
//  MapDataManager.swift
//  LetsEats
//
//  Created by Ricardo Roman Landeros on 26/08/22.
//

import Foundation
import MapKit

class MapDataManager: DataManager {
    
    //propiedad para almacenar la instanbcias que saquemos del plis
    private var items: [RestaurantItem] = []
    
    //propiedas computada que devuelve el array de ariba
    var annotations: [RestaurantItem] {
        self.items
    }
    
//    private func loadData() -> [[String: AnyObject]] {
//        guard let path = Bundle.main.path(forResource: "MapLocations", ofType: "plist"),
//              let itemsData = FileManager.default.contents(atPath: path),
//              let items = try! PropertyListSerialization.propertyList(from: itemsData, format: nil) as? [[String: AnyObject]] else {
//                  return [[:]]
//        }
//
//        return items
//    }
    
    //fetch(completion:)método utilizado aquí tiene un cierre de finalización como parámetro, que puede aceptar cualquier función o cierre que tome una matriz de RestaurantItemscomo parámetro:
    //(_ annotations:[RestaurantItem]) -> ())
    func fetch(completion: (_ annotations: [RestaurantItem]) -> ()){
//        if !self.items.isEmpty {
//            items.removeAll()
//        }
//
//        for data in loadData() {
//            self.items.append(RestaurantItem(dict: data))
//        }
//        for data in self.loadPlist(file: "MapLocations") {
//            items.append(RestaurantItem(dict: data))
//        }
        let manager = RestaurantDataManager()
        manager.fetch(location: "Boston") { restaurantItems in
            self.items = restaurantItems
            completion(items)
        }
        
        //completion(items)
        
    }
    
    /**
     A veces, no sabes cuándo terminará una operación. Por ejemplo, debe realizar una acción después de haber descargado un archivo de Internet, pero no sabe cuánto tardará en descargarse. Puede especificar un cierre de finalización que se aplicará una vez que se haya completado la operación. En este caso, el cierre de finalización procesará la matriz una vez que se hayan leído itemstodos los datos del archivo..plist
     */
    
    //Este métodotoma dos parámetros y devuelve una MKCoordinateRegioninstancia. latDeltaespecifica la distancia de norte a sur (medida en grados) para mostrar la región del mapa. Un grado es aproximadamente 69 millas. longDeltaespecifica la cantidad de distancia de este a oeste (medida en grados) para mostrar en la región del mapa. La MKCoordinateRegioninstancia que se devuelve determina la región que aparecerá en pantalla.
    func initialRegion(latDelta: CLLocationDegrees, longDelta: CLLocationDegrees) -> MKCoordinateRegion {
        guard let item = self.items.first else {
            return MKCoordinateRegion()
        }
        //latDeltay longDeltase utilizan para crear una MKCoordinateSpaninstancia, que es el tramo horizontal y vertical de la región que se creará.
        let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
        return MKCoordinateRegion(center: item.coordinate, span: span)
    }
    
}
