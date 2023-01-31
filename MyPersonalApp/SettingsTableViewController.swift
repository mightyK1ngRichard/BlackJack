//
//  SettingsTableViewController.swift
//  MyPersonalApp
//
//  Created by Дмитрий Пермяков on 31.01.2023.
//

import UIKit

class SettingsTableViewController: UITableViewController {

    @IBOutlet weak var statusSwitch: UISwitch!
    @IBOutlet weak var secondsLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadScreen()
    }
    
    func loadScreen() {
        statusSwitch.isOn = gameSettings.statusTimer
        secondsLabel.text = "\(gameSettings.TimeLabel) сек"
    }
    
    @IBAction func pressSwitch(_ sender: UISwitch) {
        gameSettings.statusTimer = sender.isOn
        loadScreen()
    }
    
    @IBAction func pressResetButton(_ sender: Any) {
        
        gameSettings.resetSettings()
        loadScreen()
    }
}
