//
//  Volume_liquidController.swift
//  CW1Calculator
//
//  Created by Abeeshan Anton on 3/17/21.
//

import Foundation

import UIKit

enum Volume_liquedUnits: Int {
    case uk_gallon, litre, uk_pint,fluid_ounce, millilitre
}

class Volume_liquidController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var UK_gallon: UITextField!
    
    @IBOutlet weak var litre: UITextField!
    
    @IBOutlet weak var UK_pint: UITextField!
    
    @IBOutlet weak var fluid_ounce: UITextField!
    
    @IBOutlet weak var millilitre: UITextField!
    
    var volume_liquid : Volume_liquid = Volume_liquid(uk_gallon: 0.0, litre: 0.0, uk_pint:0.0, fluid_ounce:0.0, millilitre: 0.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.assignDelegates()
        self.loadDefaultsData("TemparatureHistory")
        
    }
    
    func loadDefaultsData(_ historyKey :String) {
        let defaults = UserDefaults.standard
        volume_liquid.historyStringArray = defaults.object(forKey: historyKey) as? [String] ?? [String]()
    }
    
    func assignDelegates() {
        UK_gallon.delegate = self
        litre.delegate = self
        UK_pint.delegate = self
        fluid_ounce.delegate = self
        millilitre.delegate = self
    }
    
    @IBAction func onValueChange(_ sender: UITextField) {
        
        guard let textFieldValue = sender.text else { return }
        guard let doubleTextFieldValue = Double(textFieldValue) else { return }
        
        switch Volume_liquedUnits(rawValue: sender.tag)!{
        
        
        case .uk_gallon:
            
            volume_liquid.uk_gallon = doubleTextFieldValue
            volume_liquid.litre = (doubleTextFieldValue * 4.54)
            volume_liquid.uk_pint = (doubleTextFieldValue * 9.60)
            volume_liquid.fluid_ounce = (doubleTextFieldValue * 160)
            volume_liquid.millilitre = (doubleTextFieldValue * 4546)
            
            litre.text = "\(volume_liquid.litre)"
            UK_pint.text = "\(volume_liquid.uk_pint)"
            fluid_ounce.text = "\(volume_liquid.fluid_ounce)"
            millilitre.text = "\(volume_liquid.millilitre)"
            
        case .litre:
            
            volume_liquid.litre = doubleTextFieldValue
            volume_liquid.uk_gallon = (doubleTextFieldValue / 4.54)
            volume_liquid.uk_pint = (doubleTextFieldValue * 1.76)
            volume_liquid.fluid_ounce = (doubleTextFieldValue * 35.19)
            volume_liquid.millilitre = (doubleTextFieldValue * 1000)
            
            UK_gallon.text = "\(volume_liquid.uk_gallon)"
            UK_pint.text = "\(volume_liquid.uk_pint)"
            fluid_ounce.text = "\(volume_liquid.fluid_ounce)"
            millilitre.text = "\(volume_liquid.millilitre)"
            
        case .uk_pint:
            
            volume_liquid.uk_pint = doubleTextFieldValue
            volume_liquid.uk_gallon = (doubleTextFieldValue / 8)
            volume_liquid.litre = (doubleTextFieldValue / 1.76)
            volume_liquid.fluid_ounce = (doubleTextFieldValue * 20)
            volume_liquid.millilitre = (doubleTextFieldValue * 568)
            
            UK_gallon.text = "\(volume_liquid.uk_gallon)"
            litre.text = "\(volume_liquid.litre)"
            fluid_ounce.text = "\(volume_liquid.fluid_ounce)"
            millilitre.text = "\(volume_liquid.millilitre)"
            
        case .fluid_ounce:
            
            volume_liquid.fluid_ounce = doubleTextFieldValue
            volume_liquid.uk_pint = (doubleTextFieldValue /  20)
            volume_liquid.litre = (doubleTextFieldValue / 35.19)
            volume_liquid.uk_gallon = (doubleTextFieldValue / 160)
            volume_liquid.millilitre = (doubleTextFieldValue * 28.41)
            
            UK_gallon.text = "\(volume_liquid.uk_gallon)"
            litre.text = "\(volume_liquid.litre)"
            UK_pint.text = "\(volume_liquid.uk_pint)"
            millilitre.text = "\(volume_liquid.millilitre)"
            
        case .millilitre:
            
            volume_liquid.millilitre = doubleTextFieldValue
            volume_liquid.uk_pint = (doubleTextFieldValue /  568)
            volume_liquid.litre = (doubleTextFieldValue / 1000)
            volume_liquid.uk_gallon = (doubleTextFieldValue / 4546)
            volume_liquid.fluid_ounce = (doubleTextFieldValue / 28.41)
            
            UK_gallon.text = "\(volume_liquid.uk_gallon)"
            litre.text = "\(volume_liquid.litre)"
            UK_pint.text = "\(volume_liquid.uk_pint)"
            fluid_ounce.text = "\(volume_liquid.fluid_ounce)"
        }
    }
    
    @IBAction func onSave(_ sender: UIBarButtonItem) {
        
        let defaults = UserDefaults.standard
        let historyString = "\(volume_liquid.uk_gallon) uk_gallon | \(volume_liquid.litre) litre | \(volume_liquid.uk_pint) uk_pint | \(volume_liquid.fluid_ounce) fluid_ounce | \(volume_liquid.millilitre) millilitre "
        
        volume_liquid.historyStringArray.append(historyString)
        defaults.set(volume_liquid.historyStringArray, forKey: "TemparatureHistory")
    }
    
    
}

