//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    // MARK: - Properties
    
    var imcBrain = ImcBrain()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    
    @IBAction func heightSlider(_ sender: UISlider) {
        imcBrain.setHeightValue(heightValue: Double(sender.value))
        heightLabel.text = "\(String(format: "%.2f", sender.value))m"
    }
    
    @IBAction func weightSlider(_ sender: UISlider) {
        imcBrain.setWeightValue(weightValue: Double(sender.value))
        weightLabel.text = "\(Int(sender.value))Kg"
    }
    
    @IBAction func calculateButton(_ sender: UIButton) {
        imcBrain.calculateImc()
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }

    // MARK: - Result View Controller
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            
            destinationVC.imcValue = String(format: "%.1f", imcBrain.imc)
            
            destinationVC.resultImc = imcBrain.getResult()
            
            destinationVC.color = imcBrain.getColor()
        }
    }
}
