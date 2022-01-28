//
//  String+Conversions.swift
//  calculator
//
//  Created by Student on 1/28/22.
//

import Foundation

extension String {
    func toDouble() -> Double? {
        return NumberFormatter().number(from: self)?.doubleValue
    }
}
