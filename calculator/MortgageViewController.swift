//
//  mortgageViewController.swift
//  calculator
//
//  Created by Student on 1/12/22.
//

import UIKit

enum LoanDuartion: String
{
    case select = "Select a duration"
    case tenYears = "10 years"
    case fifteenYears = "15 years"
    case twentyYears = "20 years"
    case twentyFiveYears = "25 years"
    case thirtyYears = "30 years"
    case fourtyYears = "40 years"
    case fiftyYears = "50 years"
}

class mortgageViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBOutlet weak var homeValue: UITextField!
    @IBOutlet weak var downPayment: UITextField!
    @IBOutlet weak var mortgageAmount: UILabel!
    @IBOutlet weak var calculate: UIButton!
    @IBOutlet weak var loanDurations: UIPickerView!
    
    @IBAction func computeMortgage(_ sender: UIButton)
    {
        if let homeValueSt = homeValue.text, let downPaymentSt = downPayment.text
        {
            if let homeValue = Int(homeValueSt), let downPayment = Int(downPaymentSt)
            {
                mortgageAmount.text = "$\(homeValue - downPayment)"
            }
        }
    }
   
    

}
