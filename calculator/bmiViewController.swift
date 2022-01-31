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
    @IBOutlet weak var weightlab: UILabel!
    @IBOutlet weak var heightlab: UILabel!
    
    @IBAction func system(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex
        {
        case 0:
            Imperial = true
            weightlab.text = "Weight (lbs):"
            heightlab.text = "Height (in):"
        case 1:
            Imperial = false
            weightlab.text = "Weight (kg):"
            heightlab.text = "Height (m):"
        default:
            Imperial = true
            weightlab.text = "Weight (lbs):"
            heightlab.text = "Height (in):"
        }
    }
    
    @IBAction func calculate(_ sender: Any)
    {
        if let weightRes = Double(weight.text!) {
            if let heightRes = Double(height.text!) {
                if (Imperial)
                {
                    Result = 703 * (weightRes/(heightRes * heightRes))
                }
                else
                {
                    Result = (weightRes)/((heightRes/10) * (heightRes/10)) * 100
                }
            }
        }
        
        let roundedResult = (Result * 1000).rounded() / 1000
        
        
        if (roundedResult < 18.5)
        {
            result.text = "Your result is \(roundedResult), underweight"
        }
        else if (roundedResult > 18.5 && roundedResult < 24.9)
        {
            result.text = "Your result is \(roundedResult), healthy."
        }
        else if (roundedResult > 25.0 && roundedResult < 29.9)
        {
            result.text = "Your result is \(roundedResult), overweight."
        }
        else if (roundedResult > 30.0)
        {
            result.text = "Your result is \(roundedResult), obese."
        }
    }
}
