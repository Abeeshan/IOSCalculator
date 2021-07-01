//
//  LenghtController.swift
//  CW1Calculator
//
//  Created by Abeeshan Anton on 3/16/21.
//

import Foundation

import UIKit

enum LenghtUnits: Int {
    case metre, kilometer, mile, centimeters, millimeters, yard, inch
}

class LengthController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var metre: UITextField!
    
    
    @IBOutlet weak var kilometer: UITextField!
    
    @IBOutlet weak var mile: UITextField!
    
    @IBOutlet weak var centimeters: UITextField!
    
    @IBOutlet weak var millimeters: UITextField!
    
    @IBOutlet weak var yard: UITextField!
    
    @IBOutlet weak var inch: UITextField!
    
    
    var length : Length = Length(metre: 0.0, kilometer: 0.0,mile:0.0,centimeters: 0.0, millimeters:0.0,yard:0.0, inch:0.0)
    
    func loadDefaultsData(_ historyKey :String) {
        let defaults = UserDefaults.standard
        length.historyStringArray = defaults.object(forKey: historyKey) as? [String] ?? [String]()
    }
    
    func assignDelegates() {
        metre.delegate = self
        kilometer.delegate = self
        mile.delegate = self
        centimeters.delegate = self
        millimeters.delegate = self
        yard.delegate = self
        inch.delegate = self
    }
    
    @IBAction func onValueChange(_ sender: UITextField) {
        
        guard let textFieldValue = sender.text else { return }
        guard let doubleTextFieldValue = Double(textFieldValue) else { return }
        
        switch LenghtUnits(rawValue: sender.tag)!{
        
        case .metre:
        length.metre = doubleTextFieldValue
        length.kilometer = (doubleTextFieldValue / 1000)
        length.mile = (doubleTextFieldValue * 0.0006)
        length.centimeters = (doubleTextFieldValue * 100)
        length.millimeters = (doubleTextFieldValue * 1000)
        length.yard = (doubleTextFieldValue * 1.09)
        length.inch = (doubleTextFieldValue * 39.37)

        kilometer.text = "\(length.kilometer)"
        mile.text = "\(length.mile)"
        centimeters.text = "\(length.centimeters)"
        millimeters.text = "\(length.millimeters)"
        yard.text = "\(length.yard)"
        inch.text = "\(length.inch)"
            
        case .kilometer:
        length.kilometer = doubleTextFieldValue
        length.metre = (doubleTextFieldValue * 1000)
        length.mile = (doubleTextFieldValue * 0.62)
        length.centimeters = (doubleTextFieldValue * 100000)
        length.millimeters = (doubleTextFieldValue * 1000000)
        length.yard = (doubleTextFieldValue * 1093.61)
        length.inch = (doubleTextFieldValue * 39370)
            
        mile.text = "\(length.mile)"
        centimeters.text = "\(length.centimeters)"
        millimeters.text = "\(length.millimeters)"
        yard.text = "\(length.yard)"
        inch.text = "\(length.inch)"
        metre.text = "\(length.metre)"
            
        case .mile:
            length.mile = doubleTextFieldValue
            length.metre = (doubleTextFieldValue * 1609.34)
            length.centimeters = (doubleTextFieldValue * 160934)
            length.millimeters = (doubleTextFieldValue * 1609340)
            length.yard = (doubleTextFieldValue * 1760)
            length.inch = (doubleTextFieldValue * 63360)
            length.kilometer = (doubleTextFieldValue * 1.60934)
            centimeters.text = "\(length.centimeters)"
            millimeters.text = "\(length.millimeters)"
            yard.text = "\(length.yard)"
            inch.text = "\(length.inch)"
            metre.text = "\(length.metre)"
            kilometer.text = "\(length.kilometer)"
            
            
        case .centimeters:
            
            length.centimeters = doubleTextFieldValue
            length.metre = (doubleTextFieldValue * 0.01)
            length.mile = (doubleTextFieldValue * 0.01)
            length.millimeters = (doubleTextFieldValue * 10)
            length.yard = (doubleTextFieldValue * 0.01)
            length.inch = (doubleTextFieldValue * 0.39)
            
            length.kilometer = (doubleTextFieldValue / 100000)
            
            millimeters.text = "\(length.millimeters)"
            yard.text = "\(length.yard)"
            inch.text = "\(length.inch)"
            metre.text = "\(length.metre)"
            kilometer.text = "\(length.kilometer)"
            mile.text = "\(length.mile)"
            
        case .millimeters:
            length.millimeters = doubleTextFieldValue
            length.metre = (doubleTextFieldValue / 1000)
            length.kilometer = (doubleTextFieldValue / 1000000)
            length.centimeters = (doubleTextFieldValue / 10)
            length.yard = (doubleTextFieldValue/1000)
            length.inch = (doubleTextFieldValue * 0.03)
            length.mile = (doubleTextFieldValue / 6.21)
            
            yard.text = "\(length.yard)"
            inch.text = "\(length.inch)"
            metre.text = "\(length.metre)"
            kilometer.text = "\(length.kilometer)"
            mile.text = "\(length.mile)"
            centimeters.text = "\(length.centimeters)"
            
        case .yard:
            length.yard = doubleTextFieldValue
            length.metre = (doubleTextFieldValue * 0.91)
            length.kilometer = (doubleTextFieldValue / 1094)
            length.mile = (doubleTextFieldValue / 1760)
            length.centimeters = (doubleTextFieldValue * 91.44)
            length.millimeters = (doubleTextFieldValue * 914)
            length.inch = (doubleTextFieldValue * 36)
            
            inch.text = "\(length.inch)"
            metre.text = "\(length.metre)"
            kilometer.text = "\(length.kilometer)"
            mile.text = "\(length.mile)"
            centimeters.text = "\(length.centimeters)"
            millimeters.text = "\(length.millimeters)"
        case .inch:
            length.inch = doubleTextFieldValue
            length.metre = (doubleTextFieldValue / 39.37)
            length.kilometer = (doubleTextFieldValue / 39370)
            length.mile = (doubleTextFieldValue / 63360)
            length.centimeters = (doubleTextFieldValue * 2.54)
            length.millimeters = (doubleTextFieldValue * 25)
            length.yard = (doubleTextFieldValue / 36)
            
            metre.text = "\(length.metre)"
            kilometer.text = "\(length.kilometer)"
            mile.text = "\(length.mile)"
            centimeters.text = "\(length.centimeters)"
            millimeters.text = "\(length.millimeters)"
            yard.text = "\(length.yard)"
        
        }
    }
    
    
    @IBAction func onSave(_ sender: UIBarButtonItem) {
        
        let defaults = UserDefaults.standard
        let historyString = "\(length.metre) metre | \(length.kilometer) kilometer | \(length.mile) mile | \(length.centimeters) centimeters | \(length.millimeters) millimeters | \(length.yard) yard | \(length.inch) inch "
        
        length.historyStringArray.append(historyString)
        defaults.set(length.historyStringArray, forKey: "TemparatureHistory")
    }
    
}
