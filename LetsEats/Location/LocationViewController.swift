//
//  LocationViewController.swift
//  LetsEats
//
//  Created by Ricardo Roman Landeros on 25/08/22.
//

import UIKit

class LocationViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let manager = LocationDataManager()
    var selectedCity: LocationItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
       // manager.fetch() //corremos fetch para que el array locatiosn se llene con los datos del plist LocatiosnData

        // Do any additional setup after loading the view.
    }
    
    
}


// MARK: Private Extension
private extension LocationViewController {
   
    func initialize() {
        //corremos fetch para que el array locatiosn se llene con los datos del plist LocatiosnData
          manager.fetch()
       }
}


// MARK: UITableViewDataSource
extension LocationViewController: UITableViewDataSource {
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manager.numberOfLocationsItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "locationCell", for: indexPath)
        
        cell.textLabel?.text = manager.locationItem(at: indexPath.row).cityAndSate
        
        return cell
    }
}


//MARK: UITableViewDelegate
extension LocationViewController: UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath){
            cell.accessoryType = .checkmark
            selectedCity = manager.locationItem(at: indexPath.row)
        }
    }
}
