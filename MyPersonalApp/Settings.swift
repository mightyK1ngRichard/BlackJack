//
//  Settings.swift
//  MyPersonalApp
//
//  Created by Дмитрий Пермяков on 31.01.2023.
//

import Foundation

struct SettingsGame {
    var statusTimer: Bool
    var TimeLabel: Int
    
    mutating func resetSettings() {
        statusTimer = true
        TimeLabel = 30
    }
    
    var getInfoAboutSettings : String? {
        return statusTimer ? "\nTimer status: On\nTimer: \(TimeLabel) sec" : "Timer status: Off\nTimer: \(TimeLabel) sec"
    }
    
}

var gameSettings = SettingsGame(statusTimer: true, TimeLabel: 30)
