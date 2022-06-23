//
//  DetalhesBlocoViewController.swift
//  HUBUnicesumar
//
//  Created by Student on 14/05/22.
//  Copyright © 2022 Student. All rights reserved.
//

import UIKit
import MapKit

class DetalhesBlocoViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var nomeBlocoLabel: UILabel!
    @IBOutlet weak var informacoesBlocoLabel: UILabel!
    @IBOutlet weak var mapa: MKMapView!
    
    var blocoSelecionado: Bloco?
    
    var lati: Double?
    var long: Double?
    
    var locationManager = CLLocationManager()
    var userLocation = CLLocation()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .dark
        
        lati = blocoSelecionado?.latitude
        long = blocoSelecionado?.longitude
        
        nomeBlocoLabel.text = blocoSelecionado?.nome
        
        var informacoes = "";
        for informacao in blocoSelecionado!.informacoes {
            informacoes = informacoes + informacao
            informacoes += "\n"
        }
    
        informacoesBlocoLabel.text = informacoes
        
        mapa.setUserTrackingMode(.follow, animated: true)
        mapa.showsUserLocation = true
        setupLocationManager()
        addAnotationToMap()
//        addGesture()
    
    }
    
    //funcao 01 - configurando propriedades do mapa
    func setupLocationManager(){
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }
    
    // funcao 02 - configurando localizacao no mapa
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if locations.count > 0 {
            
            if let location = locations.last {
                
                userLocation = location
                print("A localizacao do usuario e \(userLocation.coordinate)")
            }
            
        }
    }
    
    // funcao 03 - adicionando anotacoes e gestos no mapa
    @objc func addAnotationToMap(){
        
        let newCoordinate = CLLocationCoordinate2D(latitude: lati!, longitude: long!)
        
        let newAnnotation = MKPointAnnotation()
        
        newAnnotation.coordinate = newCoordinate
        
        newAnnotation.title = blocoSelecionado?.nome
        newAnnotation.subtitle = String(describing: "Latitude \(newCoordinate.latitude)/ Longitude \(newCoordinate.longitude)")
        mapa.addAnnotation(newAnnotation)
        
        self.mapa.showAnnotations(self.mapa.annotations, animated: true)
    }
    
    // funcao 04 - adicionar gesto ao mapa
//    func addGesture(){
//
//        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(addAnotationToMap(gestureRecognizer:)))
//
//        longPress.minimumPressDuration = 0.8
//
//        mapa.addGestureRecognizer(longPress)
//
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
