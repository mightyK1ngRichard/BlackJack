//
//  SelectTimeViewController.swift
//  MyPersonalApp
//
//  Created by Дмитрий Пермяков on 31.01.2023.
//

import UIKit

class SelectTimeViewController: UIViewController {

    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet var choiceButtonsTime: [UIButton]!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        timeLabel.text = "Таймер: \(gameSettings.TimeLabel) сек"
    }
    
    private func updateScreen() {
        
    }
    
    @IBAction func pressButtonTime(_ sender: UIButton) {
        if let seconds = sender.titleLabel?.text {
            timeLabel.text = "Таймер: \(seconds) сек"
            gameSettings.TimeLabel = Int(seconds)!
        }
        navigationController?.popViewController(animated: true)
    }
    
    

}
