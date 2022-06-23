//
//  Bloco.swift
//  HUBUnicesumar
//
//  Created by Student on 12/05/22.
//  Copyright © 2022 Student. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

class Bloco{
    var nome: String;
    var latitude: Double!;
    var longitude: Double!;
    var informacoes: [String];
    
    init (json:[String: AnyObject]){
        self.nome = json["nome"] as? String ?? "";
        self.latitude = json["latitude"] as? Double;
        self.longitude = json["longitude"] as? Double;
        self.informacoes = [String]()
        
        if let informacoes = json["informacoes"] as? [String] {
            for jsonInformacao in informacoes {
                self.informacoes.append(jsonInformacao)
            }
        }
    }
}

class BlocoDAO {
    
    static func getBlocos (callback: @escaping (([Bloco]) -> Void)) {
        
        let endpoint: String = "https://noderedaluno12202202.kgsx7kocpw2.us-south.codeengine.appdomain.cloud/blocos"
        
        guard let url = URL(string: endpoint) else {
            print("Erroooo: Cannot create URL")
            return
        }
        
        let urlRequest = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
            
            if error != nil {
                print("Error a= \(String(describing: error))")
                return
            }
            
           // let responseString = String(data: data!, encoding: String.Encoding.utf8)
            //print("responseString = \(String(describing: responseString))")
            
            
            DispatchQueue.main.async() {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [[String: AnyObject]] {
                        
                        var blocos = [Bloco]()
                     
                        for bloco in json[0]["blocos"] as! [AnyObject]{

                        print(bloco)
                            blocos.append(Bloco(json: bloco as! [String : AnyObject]))
                        }
                        
                        
                        callback(blocos)
                        
                    }else {
                        
                        print("fudeuuuu")
                    }
                } catch let error as NSError {
                    print("Error b= \(error.localizedDescription)")
                }
            }
            
            
        })
        
        task.resume()
    }
}

//{
//    "blocos": [
//        {"nome": "Bloco 3", "latitude": -23.4415753, "longitude": -51.9173679, "informacoes": []},
//        {"nome": "Bloco 3", "latitude": -23.4415753, "longitude": -51.9173679, "informacoes": []},
//        {"nome": "Bloco 4", "latitude": -23.4415753, "longitude": -51.9173679, "informacoes": []},
//        {"nome": "Bloco 5", "latitude": -23.4431, "longitude": -51.9172, "informacoes": []},
//        {"nome": "Bloco 6", "latitude": -23.4427, "longitude": -51.9181, "informacoes": []},
//        {"nome": "Bloco 7", "latitude": -23.4420, "longitude": -51.9178, "informacoes": []},
//        {"nome": "Bloco 8", "latitude": -23.4428, "longitude": -51.9166, "informacoes": []},
//        {"nome": "Bloco 9", "latitude": -23.4415753, "longitude": -51.9173679, "informacoes": []},
//        {"nome": "Bloco 10", "latitude": -23.4410, "longitude": -51.9181, "informacoes": []},
//        {"nome": "Bloco 11", "latitude": -23.4415, "longitude": -51.9169, "informacoes": []}
//    ]
//}
