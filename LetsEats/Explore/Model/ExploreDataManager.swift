//
//  ExploreDataManager.swift
//  LetsEats
//
//  Created by Ricardo Roman Landeros on 24/08/22.
//

import Foundation

//clase de administrador de datos encargada de leer los datos de la estrutura ExploreData.plist
//que pudiera ser tambien la enncargada de leer de core data o un servicio web
class ExploreDataManager: DataManager {
    
    private var exploreItems: [ExploreItem] = []
    
    func fetch() {
        //metodo que usaremos para convetir los datos que sacamos ocn el metodo load data
        // a instancias de ExploreItem con sus dos propiedades y agregarlas ala propiedad exploreItems
        //recorremos el array de diccionarios con el for y lo convertimos en un array de instancias de ExploreItem
        //for data in loadData() {
        for data in self.loadPlist(file: "ExploreData") {
            print(data)
            exploreItems.append(ExploreItem(dict: data as! [String: String]))
        }
    }
    
    /*
    //metodo para leer los datos de exploredata.plist
    //devuelve una matris de diccionarios que la clave y el valor son String [[String: String]]
    private func loadData() -> [[String: String]]{
        //Esta declaración crea una instancia de un decodificador de lista de propiedades que se usará para decodificar los datos en el ExploreData.plist
        let decoder = PropertyListDecoder()
        //Cuando crea su aplicación, el resultado es una carpeta con todos los recursos de la aplicación dentro, llamada paquete de aplicación. ExploreData.plistestá dentro de este paquete. Esta declaración intenta obtener la ruta al ExploreData.plistarchivo y asignarlo a una constante, path
        if let path = Bundle.main.path(forResource: "ExploreData", ofType: "plist"),
           //Esta declaración intenta obtener el ExploreData.plist archivo almacenado en path y asignarlo a una constante, exploreData.
           let exploreData = FileManager.default.contents(atPath: path),
           //Esta instrucción intenta crear una matriz a partir del contenido del ExploreData.plistarchivo y asignarla a una constante exploreItems:
           let exploreItems = try? decoder.decode([[String: String]].self, from: exploreData) {
            //si todo se hace correctamente se devuelve el erreglo de diccionario obtenido de exploreData
            return exploreItems
        }
        
        //si no se devuelve un array vacio
        return [[:]]
        
    }*/
    
    //metodo que devuelve el tamaño del arreglo de epxloreItems
    func numberOfExploreitems() -> Int {
        self.exploreItems.count
    }
    
    //funcion que dveuelve un item en espeficio del arreglo exploreItems
    //devolverá una ExploreIteminstancia que corresponde a la posición de una celda en la vista de colección.
    func exploreItem(at index: Int) -> ExploreItem {
        self.exploreItems[index]
    }
    
    
}
