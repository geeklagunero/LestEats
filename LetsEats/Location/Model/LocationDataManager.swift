//
//  LocationDataManager.swift
//  LetsEats
//
//  Created by Ricardo Roman Landeros on 25/08/22.
//

import Foundation

class LocationDataManager {
    
    //agregue una propiedad de matriz, locations, para contener la lista de ubicaciones
    private var locations: [LocationItem] = []
    
    func fetch() {
        //metodo que usaremos para convetir los datos que sacamos ocn el metodo load data
        // a instancias de ExploreItem con sus dos propiedades y agregarlas ala propiedad exploreItems
        //recorremos el array de diccionarios con el for y lo convertimos en un array de string con la ciudad y el state
        for location in loadData() {
//            if let city = location["city"], let state = location["state"] {
//                self.locations.append("\(city) \(state)")
//            }
            self.locations.append(LocationItem(dict: location))
        }
    }
    
    private func loadData() -> [[String: String]]{
        //Esta declaración crea una instancia de un decodificador de lista de propiedades que se usará para decodificar los datos en el ExploreData.plist
        let decoder = PropertyListDecoder()
        //Cuando crea su aplicación, el resultado es una carpeta con todos los recursos de la aplicación dentro, llamada paquete de aplicación. ExploreData.plistestá dentro de este paquete. Esta declaración intenta obtener la ruta al ExploreData.plistarchivo y asignarlo a una constante, path
        if let path = Bundle.main.path(forResource: "LocationsData", ofType: "plist"),
           //Esta declaración intenta obtener el LocationsData.plist archivo almacenado en path y asignarlo a una constante, locationsData.
           let locationsData = FileManager.default.contents(atPath: path),
           //Esta instrucción intenta crear una matriz a partir del contenido del locationsData.plist archivo y asignarla a una constante locations:
           let locations = try? decoder.decode([[String: String]].self, from: locationsData) {
            //si todo se hace correctamente se devuelve el erreglo de diccionario obtenido de exploreData
            return locations
        }
        
        //si no se devuelve un array vacio
        return [[:]]
        
    }
    
    //metodo que devuelve el tamaño del arreglo de locations
    func numberOfLocationsItems() -> Int {
        self.locations.count
    }
    
    //funcion que dveuelve un item o elemetno en espeficio del arreglo locations
    //devolverá una string que corresponde a la posición de una celda en la vista de tabla.
    func locationItem(at index: Int) -> LocationItem {
        self.locations[index]
    }
}
