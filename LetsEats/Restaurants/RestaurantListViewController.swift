//
//  RestaurantListViewController.swift
//  LetsEats
//
//  Created by Ricardo Roman Landeros on 21/08/22.
//

import UIKit

//clase que controla la pantalla de lista de restaurantes que sigue despues de seleccionar un tipo de cocina en la pantalla de explorar
class RestaurantListViewController: UIViewController, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}


// MARK: Private Extension
private extension RestaurantListViewController {
   // code goes here
}
// MARK: UICollectionViewDataSource
extension RestaurantListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "restaurantCell", for: indexPath)
        return cell
    }
}
