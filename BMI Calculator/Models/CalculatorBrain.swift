
import Foundation
import UIKit

struct CalculatorBrain {

    var bmi : BMI?
    var color : UIColor?
    var adviceText : String?
    
    mutating func calcualateBMI(_ height: Float, _ weight: Float) {
        let bmiValue = weight / (height * height)
        
        if(bmiValue < 18.5){
            adviceText = "Eat some more you skinny kid"
            color = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)

        }else if (bmiValue <= 24.9){
            adviceText = "Pretty normal, nothing special"
            color = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        }else{
            adviceText = "You fatass! Lose some weight!"
            color = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        }
        
        bmi = BMI(value: bmiValue, advice: adviceText!, color: color!)
    }
    
    func getBMI() -> String{
        return String(format: "%.1f", bmi?.value ?? "0.0")
    }
    
    func getAdvice() -> String{
        return adviceText ?? "No advice"
    }
    
    func getColor() -> UIColor{
        return color ?? #colorLiteral(red: 0.945848763, green: 0.7158197761, blue: 0.9691899419, alpha: 0.85)
    }
    
}
