//
//  BadgeModel.swift
//  Badges
//
//  Created by Rishabh Maini on 03/12/22.
//

import Foundation
import SwiftUI

struct BadgeObject: Identifiable{
    
    var id = UUID()
    var index: Int
    var shape: String
    var beginRepetition: String
    var endRepetition: String
    var toAchieveRepetition: Int
    var lives: Int
    var endColor: ColorObject
    var midColor: ColorObject
    
    var statusCount: Int
    var livesLeft: Int
    
    var badgeAchieved: Bool
    var badgeAchievedDate: Date
    var progressLostInBackground : Date
}

struct ColorObject : Codable {
    var hue: Double
    var saturation : Double
    var brightness : Double
}




var badges : [BadgeObject] = [

    BadgeObject(index: 0, shape: "Amber", beginRepetition: "1st", endRepetition: "3rd", toAchieveRepetition: 3, lives: 0, endColor: ColorObject(hue: 0.10277, saturation: 0.78, brightness: 0.91), midColor: ColorObject(hue: 0.136111, saturation: 1, brightness: 1), statusCount: 0, livesLeft: 0, badgeAchieved: false, badgeAchievedDate: Date(),progressLostInBackground: Date()),
    BadgeObject(index: 1, shape: "Quartz", beginRepetition: "4th", endRepetition: "10th", toAchieveRepetition: 7, lives: 1, endColor: ColorObject(hue: 0.7333, saturation: 0.81, brightness: 0.95), midColor: ColorObject(hue: 0.777, saturation: 0.96, brightness: 0.99), statusCount: 0, livesLeft: 1, badgeAchieved: false, badgeAchievedDate: Date(),progressLostInBackground: Date()),
    BadgeObject(index: 2, shape: "Ruby", beginRepetition: "11th", endRepetition: "21st", toAchieveRepetition: 11, lives: 2, endColor: ColorObject(hue: 0.97777, saturation: 0.76, brightness: 0.94), midColor: ColorObject(hue: 0.919444, saturation: 0.85, brightness: 0.96), statusCount: 0, livesLeft: 2, badgeAchieved: false, badgeAchievedDate: Date(),progressLostInBackground: Date()),
    BadgeObject(index: 3, shape: "Sapphire", beginRepetition: "22nd", endRepetition: "45th", toAchieveRepetition: 24, lives: 3, endColor: ColorObject(hue: 0.6, saturation: 0.89, brightness: 0.98), midColor: ColorObject(hue: 0.541666, saturation: 1, brightness: 1), statusCount: 0, livesLeft: 3, badgeAchieved: false, badgeAchievedDate: Date(),progressLostInBackground: Date()),
    BadgeObject(index: 4, shape: "Emerald", beginRepetition: "46th", endRepetition: "90th", toAchieveRepetition: 45, lives: 4, endColor: ColorObject(hue: 0.3777, saturation: 0.83, brightness: 0.89), midColor: ColorObject(hue: 0.44166, saturation: 0.95, brightness: 1), statusCount: 0, livesLeft: 4, badgeAchieved: false, badgeAchievedDate: Date(),progressLostInBackground: Date())
    
]
