//
//  Temperature .swift
//  CW1Calculator
//
//  Created by Abeeshan Anton on 3/15/21.
//

import Foundation

class Temperature {
    var celsius : Double
    var farenheit : Double
    var kelvin : Double
    var historyStringArray : [String]
    
    init(celsius: Double, farenheit: Double, kelvin: Double) {
        self.celsius = celsius
        self.farenheit = farenheit
        self.kelvin = kelvin
        self.historyStringArray = [String]()
    }
}
