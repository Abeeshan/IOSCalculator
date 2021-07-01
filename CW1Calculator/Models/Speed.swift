//
//  Speed.swift
//  CW1Calculator
//
//  Created by Abeeshan Anton on 3/15/21.
//

import Foundation

class Speed{
    
    var metres_sec: Double
    var km_hour: Double
    var miles_hour: Double
    var nautical_miles_hour : Double
    var historyStringArray : [String]
    
    init(metres_sec: Double, km_hour: Double,miles_hour: Double, nautical_miles_hour: Double){
        self.metres_sec = metres_sec
        self.km_hour = km_hour
        self.miles_hour = miles_hour
        self.nautical_miles_hour = nautical_miles_hour
        self.historyStringArray = [String]()
    }
}
