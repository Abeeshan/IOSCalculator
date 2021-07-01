//
//  HistoryViewController.swift
//  CW1Calculator
//
//  Created by Abeeshan Anton on 3/15/21.
//

import Foundation
import UIKit

class HistoryViewController: UITableViewController {
    var history : [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initHistoryInfo()
    }
    
    func initHistoryInfo() {
        if let vcs = self.navigationController?.viewControllers {
            let previousVC = vcs[vcs.count - 2]
            
            if previousVC is TemperatureController {
               // loadDefaultsData("TemparatureHistory")
            }
            
            func loadDefaultsData(_ historyKey :String) {
                let defaults = UserDefaults.standard
                history = defaults.object(forKey: historyKey) as? [String] ?? [String]()
            }
            
            
        }
    }
}
