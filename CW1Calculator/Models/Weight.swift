//
//  Weight.swift
//  CW1Calculator
//
//  Created by Abeeshan Anton on 3/15/21.
//

import Foundation

class Weight{
    
    var kilogram: Double
    var gram: Double
    var onuces: Double
    var pounds: Double
    var stone_pounds: Double
    var historyStringArray : [String]
    
    init(kilogram: Double, gram: Double,onuces: Double, pounds: Double, stone_pounds: Double ){
        self.kilogram = kilogram
        self.gram = gram
        self.onuces = onuces
        self.pounds = pounds
        self.stone_pounds = stone_pounds
        self.historyStringArray = [String]()
    }
}
