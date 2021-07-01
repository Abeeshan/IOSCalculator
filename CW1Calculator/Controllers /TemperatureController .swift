//
//  TemperatureController .swift
//  CW1Calculator
//
//  Created by Abeeshan Anton on 3/14/21.
//

import Foundation

import UIKit

enum TemperatureUnits: Int {
    case celsius, farenheit, kelvin
}

class TemperatureController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var celsious: UITextField!
    
    @IBOutlet weak var fahrenheit: UITextField!
    
    @IBOutlet weak var kelvin: UITextField!
    
    var temperature : Temperature = Temperature(celsius: 0.0, farenheit: 0.0, kelvin: 0.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.assignDelegates()
        self.loadDefaultsData("TemparatureHistory")
        
    }
    
    func loadDefaultsData(_ historyKey :String) {
        let defaults = UserDefaults.standard
        temperature.historyStringArray = defaults.object(forKey: historyKey) as? [String] ?? [String]()
    }
    
    func assignDelegates() {
        celsious.delegate = self
        fahrenheit.delegate = self
        kelvin.delegate = self
    }
    
    
    @IBAction func onValueChange(_ sender: UITextField) {
        
        guard let textFieldValue = sender.text else { return }
        guard let doubleTextFieldValue = Double(textFieldValue) else { return }
        
    
        switch TemperatureUnits(rawValue: sender.tag)! {
            
        case .celsius:
            temperature.celsius = doubleTextFieldValue
            temperature.farenheit = (doubleTextFieldValue * 9/5 + 32)
            temperature.kelvin = doubleTextFieldValue + 273.15
            
            fahrenheit.text = "\(temperature.farenheit)"
            kelvin.text = "\(temperature.kelvin)"
        case .farenheit:
            temperature.celsius = (doubleTextFieldValue - 32) * 5/9
            temperature.farenheit = doubleTextFieldValue
            temperature.kelvin = (doubleTextFieldValue - 32) * 5/9 + 273.15
            
            celsious.text = "\(temperature.celsius)"
            kelvin.text = "\(temperature.kelvin)"
            
        case .kelvin:
            temperature.celsius = doubleTextFieldValue - 273.15
            temperature.farenheit = (doubleTextFieldValue - 273.15) * 9/5 + 32
            temperature.kelvin = doubleTextFieldValue
            
            celsious.text = "\(temperature.celsius)"
            fahrenheit.text = "\(temperature.farenheit)"
        }
    }
    
    @IBAction func onSave(_ sender: UIBarButtonItem) {
        
        let defaults = UserDefaults.standard
        let historyString = "\(temperature.celsius) celsius | \(temperature.farenheit) farenheit | \(temperature.kelvin) kelvin"
        
        temperature.historyStringArray.append(historyString)
        defaults.set(temperature.historyStringArray, forKey: "TemparatureHistory")
    }
    
    
}
