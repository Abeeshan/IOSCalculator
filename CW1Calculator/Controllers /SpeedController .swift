//
//  SpeedController .swift
//  CW1Calculator
//
//  Created by Abeeshan Anton on 3/17/21.
//

import Foundation

import UIKit

enum SpeedUnits: Int {
    case metres_sec, km_hour, miles_hour, nautical_miles_hour
}

class SpeedController: UIViewController,UITextFieldDelegate{
    
    
    @IBOutlet weak var metres_sec: UITextField!
    
    @IBOutlet weak var km_hour: UITextField!
    
    @IBOutlet weak var miles_hour: UITextField!
    
    @IBOutlet weak var nautical_miles_hour: UITextField!
    
    var speed : Speed = Speed(metres_sec: 0.0, km_hour: 0.0, miles_hour:0.0, nautical_miles_hour:0.0 )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.assignDelegates()
        self.loadDefaultsData("TemparatureHistory")
        
    }
    
    func loadDefaultsData(_ historyKey :String) {
        let defaults = UserDefaults.standard
        speed.historyStringArray = defaults.object(forKey: historyKey) as? [String] ?? [String]()
    }
    
    func assignDelegates() {
        metres_sec.delegate = self
        km_hour.delegate = self
        miles_hour.delegate = self
        nautical_miles_hour.delegate = self
    }
    
    @IBAction func onValueChange(_ sender: UITextField) {
        
        guard let textFieldValue = sender.text else { return }
        guard let doubleTextFieldValue = Double(textFieldValue) else { return }
        
        switch SpeedUnits(rawValue: sender.tag)!{
        
        
        case .metres_sec:
            
            speed.metres_sec = doubleTextFieldValue
            speed.km_hour = (doubleTextFieldValue * 3.6)
            speed.miles_hour = (doubleTextFieldValue * 2.23)
            speed.nautical_miles_hour = (doubleTextFieldValue * 1.94)
            
            km_hour.text = "\(speed.km_hour)"
            miles_hour.text = "\(speed.miles_hour)"
            nautical_miles_hour.text = "\(speed.nautical_miles_hour)"
            
        case .km_hour:
            
            speed.km_hour = doubleTextFieldValue
            speed.metres_sec = (doubleTextFieldValue / 3.6)
            speed.miles_hour = (doubleTextFieldValue / 1.60)
            speed.nautical_miles_hour = (doubleTextFieldValue / 1.85)
            
            metres_sec.text = "\(speed.metres_sec)"
            miles_hour.text = "\(speed.miles_hour)"
            nautical_miles_hour.text = "\(speed.nautical_miles_hour)"
            
        case .miles_hour:
            
            speed.miles_hour = doubleTextFieldValue
            speed.metres_sec = (doubleTextFieldValue / 2.23)
            speed.km_hour = (doubleTextFieldValue * 1.60)
            speed.nautical_miles_hour = (doubleTextFieldValue / 1.15)
            
            metres_sec.text = "\(speed.metres_sec)"
            km_hour.text = "\(speed.km_hour)"
            nautical_miles_hour.text = "\(speed.nautical_miles_hour)"
            
        case .nautical_miles_hour:
            
            speed.nautical_miles_hour = doubleTextFieldValue
            speed.metres_sec = (doubleTextFieldValue / 1.94)
            speed.km_hour = (doubleTextFieldValue * 1.85)
            speed.miles_hour = (doubleTextFieldValue * 1.15)
            
            metres_sec.text = "\(speed.metres_sec)"
            km_hour.text = "\(speed.km_hour)"
            miles_hour.text = "\(speed.miles_hour)"
            
        }
    }
    
    @IBAction func onSave(_ sender: UIBarButtonItem) {
        
        let defaults = UserDefaults.standard
        let historyString = "\(speed.metres_sec) metres_sec | \(speed.km_hour) km_hour | \(speed.miles_hour) miles_hour | \(speed.nautical_miles_hour) nautical_miles_hour"
        
        speed.historyStringArray.append(historyString)
        defaults.set(speed.historyStringArray, forKey: "TemparatureHistory")
    }
    
    
}
