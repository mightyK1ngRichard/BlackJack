//
//  BlackJack.swift
//  MyPersonalApp
//
//  Created by Дмитрий Пермяков on 31.01.2023.
//

import Foundation

enum Suit: String {
    case Hearts = "♡"
    case Diamonds = "♢"
    case Clubs = "♣"
    case Spades = "♤"
}

struct Card {
    var suit: Suit
    var cardInfo: String
    var number: Int
}

let allCards = [
    Card(suit: .Clubs, cardInfo: "2", number: 2),
    Card(suit: .Clubs, cardInfo: "3", number: 3),
    Card(suit: .Clubs, cardInfo: "4", number: 4),
    Card(suit: .Clubs, cardInfo: "5", number: 5),
    Card(suit: .Clubs, cardInfo: "6", number: 6),
    Card(suit: .Clubs, cardInfo: "7", number: 7),
    Card(suit: .Clubs, cardInfo: "8", number: 8),
    Card(suit: .Clubs, cardInfo: "9", number: 9),
    Card(suit: .Clubs, cardInfo: "10", number: 10),
    Card(suit: .Clubs, cardInfo: "Валет", number: 8),
    Card(suit: .Clubs, cardInfo: "Дама", number: 9),
    Card(suit: .Clubs, cardInfo: "Король", number: 10),
    Card(suit: .Clubs, cardInfo: "Туз", number: 11),
    
    Card(suit: .Diamonds, cardInfo: "2", number: 2),
    Card(suit: .Diamonds, cardInfo: "3", number: 3),
    Card(suit: .Diamonds, cardInfo: "4", number: 4),
    Card(suit: .Diamonds, cardInfo: "5", number: 5),
    Card(suit: .Diamonds, cardInfo: "6", number: 6),
    Card(suit: .Diamonds, cardInfo: "7", number: 7),
    Card(suit: .Diamonds, cardInfo: "8", number: 8),
    Card(suit: .Diamonds, cardInfo: "9", number: 9),
    Card(suit: .Diamonds, cardInfo: "10", number: 10),
    Card(suit: .Diamonds, cardInfo: "Валет", number: 8),
    Card(suit: .Diamonds, cardInfo: "Дама", number: 9),
    Card(suit: .Diamonds, cardInfo: "Король", number: 10),
    Card(suit: .Diamonds, cardInfo: "Туз", number: 11),
    
    Card(suit: .Hearts, cardInfo: "2", number: 2),
    Card(suit: .Hearts, cardInfo: "3", number: 3),
    Card(suit: .Hearts, cardInfo: "4", number: 4),
    Card(suit: .Hearts, cardInfo: "5", number: 5),
    Card(suit: .Hearts, cardInfo: "6", number: 6),
    Card(suit: .Hearts, cardInfo: "7", number: 7),
    Card(suit: .Hearts, cardInfo: "8", number: 8),
    Card(suit: .Hearts, cardInfo: "9", number: 9),
    Card(suit: .Hearts, cardInfo: "10", number: 10),
    Card(suit: .Hearts, cardInfo: "Валет", number: 8),
    Card(suit: .Hearts, cardInfo: "Дама", number: 9),
    Card(suit: .Hearts, cardInfo: "Король", number: 10),
    Card(suit: .Hearts, cardInfo: "Туз", number: 11),
    
    Card(suit: .Spades, cardInfo: "2", number: 2),
    Card(suit: .Spades, cardInfo: "3", number: 3),
    Card(suit: .Spades, cardInfo: "4", number: 4),
    Card(suit: .Spades, cardInfo: "5", number: 5),
    Card(suit: .Spades, cardInfo: "6", number: 6),
    Card(suit: .Spades, cardInfo: "7", number: 7),
    Card(suit: .Spades, cardInfo: "8", number: 8),
    Card(suit: .Spades, cardInfo: "9", number: 9),
    Card(suit: .Spades, cardInfo: "10", number: 10),
    Card(suit: .Spades, cardInfo: "Валет", number: 8),
    Card(suit: .Spades, cardInfo: "Дама", number: 9),
    Card(suit: .Spades, cardInfo: "Король", number: 10),
    Card(suit: .Spades, cardInfo: "Туз", number: 11),
    
]

class GameBlackJack {
    static var shared = GameBlackJack()
    private var userSum = 0
    private var cardsForGame = allCards
    private var dealerSum = 0
    
    func getGameResult() -> (Int, Int){
        return (userSum, dealerSum)
    }
    
    func TakeCard() -> (Int, String?, String?) {
        cardsForGame.shuffle()
        if let takenCard = cardsForGame.popLast() {
            userSum += takenCard.number
            return (userSum, takenCard.cardInfo, takenCard.suit.rawValue)
        }
        return (userSum, nil, nil)
    }
    
    func StepDealer() -> (Int, String?, String?) {
        cardsForGame.shuffle()
        if let takenCard = cardsForGame.popLast() {
            dealerSum += takenCard.number
            return (dealerSum, takenCard.cardInfo, takenCard.suit.rawValue)
        }
        return (dealerSum, nil, nil)
    }
    
    func resetGame() {
        userSum = 0
        dealerSum = 0
        cardsForGame = allCards
    }
}
