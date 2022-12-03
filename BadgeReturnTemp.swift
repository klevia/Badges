//
//  BadgeReturnTemp.swift
//  Badges
//
//  Created by Rishabh Maini on 03/12/22.
//

import SwiftUI

struct BadgeReturnTemp: View {
    
    @StateObject var badge: BadgeViewModel = BadgeViewModel()
    
    var body: some View {
        
        VStack{
            
          
                
                RoundedRectangle(cornerRadius: 20)
                    .overlay(
                        Text(badge.currentBadgeStatus(defaultBadges: badges).first(where: {$0.badgeAchieved == false})!.shape)
                            .foregroundColor(.white)
                    )
                    .padding(64)
            
           
        }
        .environmentObject(badge)
    }
}

var badges : [BadgeObject] = [

    BadgeObject(index: 0, shape: "Triangle", beginRepetition: "1st", endRepetition: "3rd", toAchieveRepetition: 3, lives: 0, statusCount: 0, livesLeft: 0, badgeAchieved: false, badgeAchievedDate: Date()),
    BadgeObject(index: 1, shape: "Diamond", beginRepetition: "4th", endRepetition: "10th", toAchieveRepetition: 7, lives: 1, statusCount: 0, livesLeft: 1, badgeAchieved: false, badgeAchievedDate: Date()),
    BadgeObject(index: 2, shape: "Pentagon", beginRepetition: "11th", endRepetition: "21st", toAchieveRepetition: 11, lives: 2, statusCount: 0, livesLeft: 2, badgeAchieved: false, badgeAchievedDate: Date()),
    BadgeObject(index: 3, shape: "Hexagon", beginRepetition: "22nd", endRepetition: "45th", toAchieveRepetition: 24, lives: 3, statusCount: 0, livesLeft: 3, badgeAchieved: false, badgeAchievedDate: Date()),
    BadgeObject(index: 4, shape: "Septagon", beginRepetition: "46th", endRepetition: "90th", toAchieveRepetition: 45, lives: 4, statusCount: 0, livesLeft: 4, badgeAchieved: false, badgeAchievedDate: Date())
    
]

struct BadgeReturnTemp_Previews: PreviewProvider {
    static var previews: some View {
        BadgeReturnTemp()
    }
}
