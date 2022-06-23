//
//  EventosViewController.swift
//  HUBUnicesumar
//
//  Created by Student on 25/05/22.
//  Copyright © 2022 Student. All rights reserved.
//

import UIKit

class EventosViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .dark
        
    }
    
    @IBAction func Btn_One(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "https://www.unicesumar.edu.br/presencial/comuneek/")! as URL, options: [:], completionHandler: nil)
    }
    
    
    @IBAction func Btn_Two(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "https://www.unicesumar.edu.br/premio-decolar/")! as URL, options: [:], completionHandler: nil)
    }
    
    
    @IBAction func Btn_Three(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "https://www.unicesumar.edu.br/presencial/curso-de-ferias-de-inverno-2022/")! as URL, options: [:], completionHandler: nil)
    }
    
    @IBAction func Btn_Four(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "https://www.unicesumar.edu.br/presencial/nivelamento2022/")! as URL, options: [:], completionHandler: nil)
    }
    
    
    
}

