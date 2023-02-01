//
//  GameViewController.swift
//  MyPersonalApp
//
//  Created by Дмитрий Пермяков on 31.01.2023.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var userCardLabel: UIImageView!
    @IBOutlet weak var dealerCardLabel: UIImageView!
    @IBOutlet weak var stopTakeCardButton: UIButton!
    @IBOutlet weak var takeCardButton: UIButton!
    
    @IBOutlet weak var sumLabel: UILabel!
    
    @IBOutlet weak var dealerSumLabel: UILabel!
    
    @IBOutlet weak var resultGameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GameBlackJack.shared.resetGame()
    }
    
    private func loadDataOnVC() {
        let res = GameBlackJack.shared.TakeCard()
        sumLabel.isHidden = false
        if let name = res.1 {
            let userSum = res.0
            if userCardLabel.isHidden {
                userCardLabel.isHidden = false
            }
            sumLabel.text = "\(userSum)"
            userCardLabel.image = UIImage(named: name)
            if userSum > 21 {
                resultGameLabel.isHidden = false
                resultGameLabel.textColor = .red
                resultGameLabel.text = "Вы проиграли!"
                takeCardButton.isHidden = true
                stopTakeCardButton.isHidden = true
                return
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
            if let name = res.1 {
                let dealerSum = res.0
                if dealerCardLabel.isHidden {
                    dealerCardLabel.isHidden = false
                }
                dealerSumLabel.text = "\(dealerSum)"
                dealerCardLabel.image = UIImage(named: name)
                if dealerSum > 21 {
                    resultGameLabel.isHidden = false
                    resultGameLabel.textColor = .green
                    resultGameLabel.text = "Вы победили!"
                    return true
                }
                
                if dealerSum >= 16 {
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
            let (userSum, dealerSum) = GameBlackJack.shared.getGameResult()
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
