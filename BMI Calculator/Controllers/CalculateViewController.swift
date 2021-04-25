//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    @IBOutlet weak var heightValueLabel: UILabel!
    @IBOutlet weak var weightValueLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
 
    var calculatorBrain = CalculatorBrain()
    
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        heightValueLabel.text = String(format: "%.2f m", sender.value)
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        weightValueLabel.text = "\(Int(sender.value)) Kg"
    }

    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        calculatorBrain.calcualateBMI(height, weight)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "goToResult"){
            let desitinationVC = segue.destination as! ResultViewController
            desitinationVC.bmiValue = calculatorBrain.getBMI()
            desitinationVC.advice = calculatorBrain.getAdvice()
            desitinationVC.backgroundColor = calculatorBrain.getColor()
        }
    }

}

