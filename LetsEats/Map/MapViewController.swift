//
//  MapViewController.swift
//  LetsEats
//
//  Created by Ricardo Roman Landeros on 26/08/22.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    private let manager = MapDataManager()
    var selectedRestaurant: RestaurantItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case Segue.showDetail.rawValue:
            showRestaurantDetail(segue: segue)
        default:
            print("segue no valido")
        }
    }
    

}



// MARK: Private Extension
private extension MapViewController {
    func initialize() {
        mapView.delegate = self
        manager.fetch { annotations in
            setupMap(annotations)
        }
    }

    func setupMap(_ annotations: [RestaurantItem]){
        mapView.setRegion(manager.initialRegion(latDelta: 0.5, longDelta: 0.5), animated: true)
        mapView.addAnnotations(manager.annotations)
    }
    
    func showRestaurantDetail(segue: UIStoryboardSegue) {
        if let viewController = segue.destination as? RestaurantDetailViewController, let restaurant = selectedRestaurant {
            viewController.selectedRestaurant = restaurant
        }
    }
    
}



// MARK: MKMapViewDelegate
extension MapViewController: MKMapViewDelegate {
   
    //Se activa cuando el usuario toca el botón de burbuja de llamada.
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        guard let annotation = mapView.selectedAnnotations.first else {
            return
        }
        
        self.selectedRestaurant = annotation as? RestaurantItem
        
        
        //self.performSegue(withIdentifier: Segue.showDetail.rawValue, sender: self)realiza el seguimiento con el "showDetail"identificador, que presenta la pantalla Detalles del restaurante .
        self.performSegue(withIdentifier: Segue.showDetail.rawValue, sender: self)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let iidentifier = "custompin"
        
        //Además de las anotaciones que especifique, una MKMapViewinstancia también agregará una anotación para la ubicación del usuario. Esta guarddeclaración verifica sila anotación es la ubicación del usuario. Si es así, nilse devuelve, ya que la ubicación del usuario no es una ubicación de restaurante
        guard !annotation.isKind(of: MKUserLocation.self) else {
            return nil
        }
        
        let annotationView: MKAnnotationView
        //La ifdeclaración verifica si hay anotaciones existentes que inicialmente estaban visibles pero que ya no están en la pantalla. Si las hay, la MKAnnotationViewinstancia de esa anotación se puede reutilizar y se asigna a la annotationViewvariable. El annotationparámetro se asigna a la annotationpropiedad de annotationView.
        if let customAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: iidentifier){
            annotationView = customAnnotationView
            annotationView.annotation = annotation
        } else {
            //La elsecláusula se ejecuta si no hay MKAnnotationViewinstancias existentes que se puedan reutilizar. Se crea una nueva MKAnnotationViewinstancia con el identificador de reutilización especificado anteriormente ( custompin). La MKAnnotationViewinstancia está configurada con una llamada.
            let av = MKAnnotationView(annotation: annotation, reuseIdentifier: iidentifier)
            av.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            annotationView = av
        }
        
        annotationView.canShowCallout = true
        
        if let image = UIImage(named: "custom-annotation"){
            annotationView.image = image
            annotationView.centerOffset = CGPoint(x: -image.size.width / 2, y: -image.size.height / 2)
        }
        
        
        return annotationView
    }
    
}
