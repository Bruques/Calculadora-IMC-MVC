//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    var imcBrain = ImcBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func heightSlider(_ sender: UISlider) {
        imcBrain.getHeightValue(heightValue: Double(sender.value))
        heightLabel.text = "\(String(format: "%.2f", sender.value))m"
    }
    
    @IBAction func weightSlider(_ sender: UISlider) {
        imcBrain.getWeightValue(weightValue: Double(sender.value))
        weightLabel.text = "\(Int(sender.value))Kg"
    }
    
    @IBAction func calculateButton(_ sender: UIButton) {
        imcBrain.calculateImc()
        
        self.performSegue(withIdentifier: "goToResult", sender: self) //Utilizamos o self, pois o performSegue é um método de instancia da UIViewController. E no sender também, utilizamos self, pois é como se ele perguntasse, quem está enviando essa informação, ou melhor, essa chamada está partindo de onde? No caso, da calculateViewController: UIViewController.
            //Então toda vez que pressionamos o botao calculate, ele cria um identificador
    }
    //O método abaixo é chamado para que possamos identificar a segue que queremos enviar as informaçõs "func prepare()"
    //Dizemos que, se a segue.identifier for igual ao nosso identifier(que no caso é a segue que criamos "goToResult"), então, crie uma (let) para receber o destino (segue.destination), e depois disso conseguimos enviar o valor que queremos. Porém temos que usar um "as!", e a nossa classe, que no caso é a que queremos passar o valor, que é a ResultViewController, pois sem o as! o xcode não consegue encontrar as propriedades presentes na classe ResultViewController.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" { //Fazemos isso em caso de existir mais de uma viewController, assim garantindo que a que vamos enviar os dados é a que identificamos
            let destinationVC = segue.destination as! ResultViewController //temos que usar um as! pois a informação que queremos pegar abaixo, que e a imcValue só existe na nossa clase ResultViewController. E o .destination é UIViewController, e no caso a imcValue não está na UIViewController e sim na Result, é como se disséssemos que a ResultViewController é do tipo UiViewController.
            destinationVC.imcValue = String(format: "%.1f", imcBrain.imc)
            
            destinationVC.resultImc = imcBrain.getResult()
            
            destinationVC.color = imcBrain.getColor()
        }
    }
    
}

