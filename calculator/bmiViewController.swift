//
//  bmiViewController.swift
//  calculator
//
//  Created by Student on 1/12/22.
//

import UIKit

class bmiViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    var Imperial: Bool = true
    var Result: Double = 0
    
    @IBOutlet weak var imperialormetric: UISegmentedControl!
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var height: UITextField!
    @IBOutlet weak var result: UILabel!
    
    @IBAction func system(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex
        {
        case 0:
            Imperial = true
            weight.text = "Weight (lbs):"
            height.text = "Height (in):"
        case 1:
            Imperial = false
            weight.text = "Weight (kg)"
            height.text = "Height (m)"
        default:
            Imperial = true
            weight.text = "Weight (lbs):"
            height.text = "Height (in):"
        }
    }
    
    @IBAction func calculate(_ sender: Any)
    {
        if (Imperial)
        {
            Result = 703 * (Int(weight.text) / (Int(height.text) * Int(height.text)))
        }
        else
        {
            Result = Int(weight.text)/(Int(height.text) * Int(height.text))
        }
        
        if (Result < 18.5)
        {
            result.text = "Your result is: \(Result). Underweight"
        }
        else if (Result < 24.9)
        {
            result.text = "Your result is \(Result). Normal Weight"
        }
        else if (Result < 29.9)
        {
            result.text = "Your result is \(Result). Overweight."
        }
        else if (Result < 34.9)
        {
            result.text = "Your result is \(Result). Obesity class 1"
        }
        else if (Result < 39.9)
        {
            result.text = "Your result is \(Result). Obesity class 2"
        }
        else if (Result > 40)
        {
            result.text = "Your result is \(Result). Obesity class 3."
        }
    }
    
    
}
