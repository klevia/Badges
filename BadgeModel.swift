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
    
    var statusCount: Int
    var livesLeft: Int
    
    var badgeAchieved: Bool
    var badgeAchievedDate: Date
}


var badges : [BadgeObject] = [

    BadgeObject(index: 0, shape: "Triangle", beginRepetition: "1st", endRepetition: "3rd", toAchieveRepetition: 3, lives: 0, statusCount: 0, livesLeft: 0, badgeAchieved: false, badgeAchievedDate: Date()),
    BadgeObject(index: 1, shape: "Ruby", beginRepetition: "4th", endRepetition: "10th", toAchieveRepetition: 7, lives: 1, statusCount: 0, livesLeft: 1, badgeAchieved: false, badgeAchievedDate: Date()),
    BadgeObject(index: 2, shape: "Pentagon", beginRepetition: "11th", endRepetition: "21st", toAchieveRepetition: 11, lives: 2, statusCount: 0, livesLeft: 2, badgeAchieved: false, badgeAchievedDate: Date()),
    BadgeObject(index: 3, shape: "Hexagon", beginRepetition: "22nd", endRepetition: "45th", toAchieveRepetition: 24, lives: 3, statusCount: 0, livesLeft: 3, badgeAchieved: false, badgeAchievedDate: Date()),
    BadgeObject(index: 4, shape: "Septagon", beginRepetition: "46th", endRepetition: "90th", toAchieveRepetition: 45, lives: 4, statusCount: 0, livesLeft: 4, badgeAchieved: false, badgeAchievedDate: Date())
    
]
