//
//  ViewController.swift
//  calculator
//
//  Created by Student on 1/12/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapButtion() {
        performSegue(withIdentifier: "segue1", sender: self)
    }
    
    @IBAction func didTapButton2() {
        performSegue(withIdentifier: "segue2", sender: self)
    }
    
    @IBAction func didTapButton3() {
        performSegue(withIdentifier: "segue3", sender: self)
    }
}

