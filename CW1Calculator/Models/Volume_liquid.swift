//
//  Volume_liquid.swift
//  CW1Calculator
//
//  Created by Abeeshan Anton on 3/15/21.
//

import Foundation

class Volume_liquid{
    
    var uk_gallon: Double
    var litre: Double
    var uk_pint: Double
    var fluid_ounce: Double
    var millilitre: Double
    var historyStringArray : [String]
    
    init(uk_gallon: Double, litre: Double,uk_pint: Double, fluid_ounce: Double, millilitre: Double ){
        self.uk_gallon = uk_gallon
        self.litre = litre
        self.uk_pint = uk_pint
        self.fluid_ounce = fluid_ounce
        self.millilitre = millilitre
        self.historyStringArray = [String]()
    }
}
