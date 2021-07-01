//
//  Length .swift
//  CW1Calculator
//
//  Created by Abeeshan Anton on 3/15/21.
//

import Foundation

class Length{
    
    var metre: Double
    var kilometer: Double
    var mile: Double
    var centimeters: Double
    var millimeters: Double
    var yard: Double
    var inch: Double
    var historyStringArray : [String]
    
    init(metre: Double, kilometer: Double, mile: Double, centimeters: Double, millimeters: Double, yard: Double, inch: Double ){
        self.metre = metre
        self.kilometer = kilometer
        self.mile = mile
        self.centimeters = centimeters
        self.millimeters = millimeters
        self.yard = yard
        self.inch = inch
        self.historyStringArray = [String]()
    }
}
