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
    case fifteenYears = "15 years"
    case thirtyYears = "30 years"
}

class Common
{
    var loanDuration: Int
    var loanAmount: Int
    var rate: Double
    
    init (loanDuration: Int, loanAmount: Int, rate: Double)
    {
        self.loanDuration = loanDuration
        self.loanAmount = loanAmount
        self.rate = rate
    }
}

class Mortgage
{
    public func computeMortgage(common: Common) -> Double
    {
        let interestRate = common.rate/(100*12)
        return ((Double(common.loanAmount) * interestRate)/(1 - pow(1/(1+interestRate), Double(common.loanDuration))))
    }
}

class mortgageViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource
{
    
    let durationoptions = [LoanDuartion.select.rawValue, LoanDuartion.fifteenYears.rawValue, LoanDuartion.thirtyYears.rawValue]
    var rateMap: [String: Double] = [:]
    var loanAmount: Int = 300000
    var tenure: Int = 100
    var rate: Double = 30 * 12
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return durationoptions.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return durationoptions[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch durationoptions[row]
        {
            case LoanDuartion.fifteenYears.rawValue:
                self.tenure = 15 * 12
            case LoanDuartion.thirtyYears.rawValue:
                self.tenure = 30 * 12
            default:
                self.tenure = 30 * 12
        }
        
        if let currentRate = rateMap[durationoptions[row]]
        {
            self.rate = currentRate
            rateAPR.text = "\(currentRate)%"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateRateMap()
        loanDurations.delegate = self
        loanDurations.dataSource = self
    }
    
    @IBOutlet weak var homeValue: UITextField!
    @IBOutlet weak var downPayment: UITextField!
    @IBOutlet weak var mortgageAmount: UILabel!
    @IBOutlet weak var rateValue: UILabel!
    @IBOutlet weak var calculate: UIButton!
    @IBOutlet weak var loanDurations: UIPickerView!
    @IBOutlet weak var rateAPR: UITextField!
    @IBOutlet weak var mortgageamount: UILabel!
    
    
    @IBAction func computeMortgage(_ sender: UITextField) {
        if let homeValueSt = homeValue.text, let downPaymentSt = downPayment.text
        {
            if let homeValue = Int(homeValueSt), let downPayment = Int(downPaymentSt)
            {
                loanAmount = homeValue - downPayment
                mortgageamount.text = "$\(loanAmount)"
            }
        }
    }
    
    private func populateRateMap()
    {
        for duration in durationoptions
        {
            switch duration
            {
                case LoanDuartion.fifteenYears.rawValue:
                    rateMap[LoanDuartion.fifteenYears.rawValue] = 2.75
                case LoanDuartion.thirtyYears.rawValue:
                    rateMap[LoanDuartion.thirtyYears.rawValue] = 3.0
                default:
                    rateMap[LoanDuartion.select.rawValue] = 100.0
            }
        }
    }
    
    @IBAction func computeMortgageMonth(_ sender: UIButton)
    {
        mortgageAmount.text = "\(String(format: "%.2f", Mortgage().computeMortgage(common: self.createCommon())))$"
    }
    
   
    
    private func createCommon() -> Common
    {
        return Common(loanDuration: self.tenure, loanAmount: self.loanAmount, rate: self.rate)
    }
    
    
}
