//
//  ExploreItem.swift
//  LetsEats
//
//  Created by Ricardo Roman Landeros on 24/08/22.
//

import Foundation

//structura para represnetar un item de la pantalla explorar de la colleccion view
struct ExploreItem {
    let name: String?
    let image: String?
}

extension ExploreItem {
    init(dict: [String: String]){
        self.name = dict["name"]
        self.image = dict["image"]
    }
}
