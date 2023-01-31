//
//  ViewController.swift
//  MyPersonalApp
//
//  Created by Дмитрий Пермяков on 31.01.2023.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var textLabel: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textLabel.text = gameSettings.getInfoAboutSettings
    }
}
