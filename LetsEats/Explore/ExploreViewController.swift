//
//  ExploreViewController.swift
//  LetsEats
//
//  Created by Ricardo Roman Landeros on 19/08/22.
//

import UIKit

//Clase que controla la pantalla de Explore la pantalla principal
class ExploreViewController: UIViewController, UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    let manager = ExploreDataManager()
    var selectedCity: LocationItem?
    var headerView: ExploreHeaderView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //corremos el fetch para que se llene el array que contendra los datos exploreItems
        //self.manager.fetch()
        initialize()
    }
    

}

// MARK: Private Extension
private extension ExploreViewController {
   
    
    func initialize() {
        //corremos el fetch para que se llene el array que contendra los datos exploreItems
       manager.fetch()
    }
    
    //metodo que se usa para salir de la ventana modal ubicacion
    @IBAction func unwindLocationCancel(segue: UIStoryboardSegue){
        //este metodo esta enlazado a la salida d ela vista de ubicacion dodne se selecciona una ubiacion
    }
    
    @IBAction func unwindLocationDone(segue: UIStoryboardSegue){
        if let viewController = segue.source as? LocationViewController {
            self.selectedCity = viewController.selectedCity
            if let location = selectedCity {
                headerView.locationLabel.text = location.cityAndSate
            }
        }
    }
    
}




// MARK: UICollectionViewDataSource
extension ExploreViewController: UICollectionViewDataSource {
   
    //metodo que se utiliza para usar el header dentro de la collectionView
    //usando un header reusable
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = self.collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath)
        headerView = header as? ExploreHeaderView
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.manager.numberOfExploreitems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "exploreCell", for: indexPath) as! ExploreCell
        
        let exploreItem = self.manager.exploreItem(at: indexPath.row)
        cell.exploreNameLabel.text = exploreItem.name
        if let nameImage = exploreItem.image {
            cell.exploreImageView.image = UIImage(named: nameImage)
        }
        
        
        
        return cell
    }
    
}
