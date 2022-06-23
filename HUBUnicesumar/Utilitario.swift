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

class Utilitario{
    var local: String;
    var horarioFuncionamento: String;
    var telefone: String!
    
    init (json:[String: AnyObject]){
        self.local = json["nome"] as? String ?? "";
        self.horarioFuncionamento = json["latitude"] as? String ?? "";
        self.telefone = json["longitude"] as? String ?? "";


    }
}

class UtilitarioDAO {
    
    static func getBlocos (callback: @escaping (([Bloco]) -> Void)) {
        
        let endpoint: String = "https://noderedaluno12202202.kgsx7kocpw2.us-south.codeengine.appdomain.cloud/utilitarios"
        
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
                     
                        for utilitario in json {

                            print(utilitario)
                            
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

