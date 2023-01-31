//
//  GameViewController.swift
//  MyPersonalApp
//
//  Created by Дмитрий Пермяков on 31.01.2023.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var dealerSumLabel: UILabel!
    @IBOutlet weak var resultGameLabel: UILabel!
    @IBOutlet weak var dealerCardLabel: UITextField!
    @IBOutlet weak var userCardLabel: UITextField!
    @IBOutlet weak var sumLabel: UILabel!
    @IBOutlet weak var takeCardButton: UIButton!
    @IBOutlet weak var stopTakeCardButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        GameBlackJack.shared.resetGame()
    }
    
    private func loadDataOnVC() {
        let res = GameBlackJack.shared.TakeCard()
        if let name = res.1, let suit = res.2 {
            let userSum = res.0
            if userCardLabel.isHidden {
                userCardLabel.isHidden = false
            }
            sumLabel.text = "Сумма игрока: \(userSum)"
            userCardLabel.text = "\(name) \n\(suit)"
            if userSum > 21 {
                resultGameLabel.isHidden = false
                resultGameLabel.textColor = .red
                resultGameLabel.text = "Вы проиграли!"
                takeCardButton.isHidden = true
                stopTakeCardButton.isHidden = true
                // STOP
            }
            
        } else {
            print("Это невозможно.")
        }
    }
    
    private func stopGame() -> Bool {
        takeCardButton.isHidden = true
        stopTakeCardButton.isHidden = true
        dealerSumLabel.isHidden = false
        dealerCardLabel.isHidden = false
        while true {
            let res = GameBlackJack.shared.StepDealer()
            if let name = res.1, let suit = res.2 {
                let dealerSum = res.0
                if dealerCardLabel.isHidden {
                    dealerCardLabel.isHidden = false
                }
                dealerSumLabel.text = "Сумма дилера: \(dealerSum)"
                dealerCardLabel.text = "\(name) \n\(suit)"
                
                if dealerSum > 21 {
                    resultGameLabel.isHidden = false
                    resultGameLabel.textColor = .green
                    resultGameLabel.text = "Вы победили!"
                    return true
                }
                
                if dealerSum >= 15 {
                    return false
                }
//                do {
//                    print("SLLLLLLLEEEEEEPPPPPPP")
//                    sleep(4)
//                }
//
            } else {
                print("Это невозможно")
                return false
            }
            
        }
    }
    
    
    @IBAction func pressTakeCard(_ sender: Any) {
        loadDataOnVC()
    }
    
    
    @IBAction func pressStop(_ sender: Any) {
        if !stopGame() {
            let userSum = GameBlackJack.shared.userSum
            let dealerSum = GameBlackJack.shared.dealerSum
            resultGameLabel.isHidden = false
            if userSum > dealerSum {
                resultGameLabel.text = "Вы победили!"
                resultGameLabel.textColor = .green
            } else if userSum < dealerSum{
                resultGameLabel.text = "Вы проиграли!"
                resultGameLabel.textColor = .red
            } else {
                resultGameLabel.text = "Ничья!"
                resultGameLabel.textColor = .green
            }
        }
        GameBlackJack.shared.resetGame()
        
    }
}
