//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Bruno Nascimento Marques on 04/02/22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    /// Data view controller
    var imcValue: String?
    var resultImc: String?
    var color: UIColor?
  
    
    @IBOutlet weak var imcLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imcLabel.text = imcValue
        adviceLabel.text = resultImc
        view.backgroundColor = color
    }
    
    @IBAction func recalculateButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil) 
    }
    

}
