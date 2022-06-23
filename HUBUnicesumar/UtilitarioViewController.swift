//
//  UtilitarioViewController.swift
//  HUBUnicesumar
//
//  Created by Student on 24/05/22.
//  Copyright © 2022 Student. All rights reserved.
//

import UIKit

class UtilitarioViewController: UIViewController {

    @IBOutlet weak var bancoButton: UIButton!
    @IBOutlet weak var bancoLabel: UILabel!
    
    @IBOutlet weak var farmaciaButton: UIButton!
    @IBOutlet weak var farmaciaLabel: UILabel!
    
    
    @IBOutlet weak var ubsButton: UIButton!
    @IBOutlet weak var ubsLabel: UILabel!
    
    @IBOutlet weak var cantinasButton: UIButton!
    @IBOutlet weak var cantinasLabel: UILabel!
    
    @IBOutlet weak var pracaButton: UIButton!
    @IBOutlet weak var pracaLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .dark
        
        title = "Utilitários"
        
        bancoLabel.isHidden = true
        farmaciaLabel.isHidden = true
        ubsLabel.isHidden = true
        cantinasLabel.isHidden = true
        pracaLabel.isHidden = true
        
        bancoLabel.text = "Local: Bloco 8\nHorario de funcionamento: 08h00 as 22h30\nTelefone: (44) 3366-9950"
        
        farmaciaLabel.text = "Local: Bloco 8\nHorario de funcionamento: 08h30 as 22h30\nTelefone: (44) 3027-6360"
        
        ubsLabel.text = "Local: Bloco 5\nHorario de funcionamento: 07h00 as 17h00 as 21h00\nTelefone: (44) 3901-2249"
        
        cantinasLabel.text = "Local: Bloco 7 e bloco 6\nHorario de funcionamento: 08h00 as 10h00 - 19h00 as 21h00\nTelefone: (44) 3027-6360"
        
        pracaLabel.text = "Local: Em Frente ao Bloco 7\nHorario de funcionamento: 08h00 as 22h30\nTelefone: (44) 3027-6380"
        
        
    }
    
    @IBAction func dropBanco(_ sender: Any) {
        if(bancoLabel.isHidden){
            bancoLabel.isHidden = false
        } else {
            bancoLabel.isHidden = true
        }
    }
    
    @IBAction func dropFarmacia(_ sender: Any) {
        if(farmaciaLabel.isHidden){
            farmaciaLabel.isHidden = false
        } else {
            farmaciaLabel.isHidden = true
        }
    }
    
    
    @IBAction func ubsDrop(_ sender: Any) {
        if(ubsLabel.isHidden){
            ubsLabel.isHidden = false
        } else {
            ubsLabel.isHidden = true
        }
    }
    
    @IBAction func cantinasDrop(_ sender: Any) {
        if(cantinasLabel.isHidden){
            cantinasLabel.isHidden = false
        } else {
            cantinasLabel.isHidden = true
        }
    }
    
    @IBAction func pracaDrop(_ sender: Any) {
        if(pracaLabel.isHidden){
            pracaLabel.isHidden = false
        } else {
            pracaLabel.isHidden = true
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
