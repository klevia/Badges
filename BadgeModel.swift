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


