//
//  WeightController.swift
//  CW1Calculator
//
//  Created by Abeeshan Anton on 3/16/21.
//

import Foundation

import UIKit

enum WeightUnits: Int {
    case kilogram,gram, onuces, pounds, stone_pounds
}


class WeightController: UIViewController, UITextFieldDelegate {
        
    @IBOutlet weak var kilogram: UITextField!
    
    @IBOutlet weak var gram: UITextField!
    
    @IBOutlet weak var onuces: UITextField!
    
    @IBOutlet weak var pounds: UITextField!
    
    @IBOutlet weak var stone_pounds: UITextField!
    
    
    var weight : Weight = Weight(kilogram:0.0,gram: 0.0, onuces: 0.0, pounds:0.0, stone_pounds:0.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.assignDelegates()
        self.loadDefaultsData("TemparatureHistory")
    }
    
    func loadDefaultsData(_ historyKey :String) {
        let defaults = UserDefaults.standard
        weight.historyStringArray = defaults.object(forKey: historyKey) as? [String] ?? [String]()
    }
    
    func assignDelegates() {
        kilogram.delegate = self
        gram.delegate = self
        onuces.delegate = self
        pounds.delegate = self
        stone_pounds.delegate = self
    }
    
    @IBAction func onValueChange(_ sender: UITextField) {
        
        guard  let textFieldValue = sender.text else {return}
        
        guard let doubleTextFieldValue = Double(textFieldValue) else { return }
        
        switch WeightUnits(rawValue: sender.tag)! {
        
        case .kilogram:
            weight.kilogram = doubleTextFieldValue
            weight.gram = (doubleTextFieldValue * 1000)
            weight.onuces = (doubleTextFieldValue * 35)
            weight.pounds = (doubleTextFieldValue * 2.2)
            weight.stone_pounds = (doubleTextFieldValue * 0.15)
            
            gram.text = "\(weight.gram)"
            onuces.text = "\(weight.onuces)"
            pounds.text = "\(weight.pounds)"
            stone_pounds.text = "\(weight.stone_pounds)"
            
        case .gram:
            weight.gram = doubleTextFieldValue
            weight.kilogram = (doubleTextFieldValue / 1000)
            weight.onuces = (doubleTextFieldValue * 0.03)
            weight.pounds = (doubleTextFieldValue * 0.02)
            weight.stone_pounds = (doubleTextFieldValue * 0.01)
            
            kilogram.text = "\(weight.kilogram)"
            onuces.text = "\(weight.onuces)"
            pounds.text = "\(weight.pounds)"
            stone_pounds.text = "\(weight.stone_pounds)"
            
        case .onuces:
            
            weight.onuces = doubleTextFieldValue
            weight.kilogram = (doubleTextFieldValue * 0.02)
            weight.pounds = (doubleTextFieldValue * 0.06)
            weight.gram = (doubleTextFieldValue * 28.3)
            weight.stone_pounds = (doubleTextFieldValue * 0.004)
            
            kilogram.text = "\(weight.kilogram)"
            gram.text = "\(weight.gram)"
            pounds.text = "\(weight.pounds)"
            stone_pounds.text = "\(weight.stone_pounds)"
            
        case .pounds:
            weight.pounds = doubleTextFieldValue
            weight.kilogram = (doubleTextFieldValue * 0.45)
            weight.onuces = (doubleTextFieldValue * 16)
            weight.gram = (doubleTextFieldValue * 453.59)
            weight.stone_pounds = (doubleTextFieldValue * 0.07)
            
            kilogram.text = "\(weight.kilogram)"
            gram.text = "\(weight.gram)"
            onuces.text = "\(weight.onuces)"
            stone_pounds.text = "\(weight.stone_pounds)"
            
        case .stone_pounds:
            weight.stone_pounds = doubleTextFieldValue
            weight.kilogram = (doubleTextFieldValue * 6.35)
            weight.pounds = (doubleTextFieldValue * 14)
            weight.gram = (doubleTextFieldValue * 6350)
            weight.onuces = (doubleTextFieldValue * 224)
            
            kilogram.text = "\(weight.kilogram)"
            gram.text = "\(weight.gram)"
            onuces.text = "\(weight.onuces)"
            pounds.text = "\(weight.pounds)"
           
        }
        
        
}
    @IBAction func onSave(_ sender: UIBarButtonItem) {
        
        let defaults = UserDefaults.standard
        let historyString = "\(weight.kilogram) kilgram | \(weight.gram) gram | \(weight.onuces) onuces | \(weight.pounds) pounds | \(weight.stone_pounds) stone_pounds"
        
        weight.historyStringArray.append(historyString)
        defaults.set(weight.historyStringArray, forKey: "TemparatureHistory")
    }
    
}
