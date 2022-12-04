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
        
        let currentBadge = badge.currentBadgeStatus(defaultBadges: badges).first(where: {$0.badgeAchieved == false})!
        ZStack{
            
            Color.black.ignoresSafeArea()
                .onTapGesture {
                    print(currentBadge.toAchieveRepetition)
                    print(currentBadge.statusCount)
                }
            
                
                Image("\(currentBadge.shape)")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(0.25)
                .frame(height: 200)
                .overlay(
                    
                    Image("\(currentBadge.shape)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .mask(
                            Color.white.opacity(1)
                                .frame(height: CGFloat((Double(currentBadge.statusCount)/Double(currentBadge.toAchieveRepetition)))*200.0)
                                .frame(maxHeight: .infinity, alignment: .bottom)
                        )
                   
                )
                
                
            
                
            
           
        }
        .environmentObject(badge)
    }
}

var badges : [BadgeObject] = [

    BadgeObject(index: 0, shape: "Triangle", beginRepetition: "1st", endRepetition: "3rd", toAchieveRepetition: 3, lives: 0, statusCount: 0, livesLeft: 0, badgeAchieved: false, badgeAchievedDate: Date()),
    BadgeObject(index: 1, shape: "Ruby", beginRepetition: "4th", endRepetition: "10th", toAchieveRepetition: 7, lives: 1, statusCount: 0, livesLeft: 1, badgeAchieved: false, badgeAchievedDate: Date()),
    BadgeObject(index: 2, shape: "Diamond", beginRepetition: "11th", endRepetition: "21st", toAchieveRepetition: 11, lives: 2, statusCount: 0, livesLeft: 2, badgeAchieved: false, badgeAchievedDate: Date()),
    BadgeObject(index: 3, shape: "Emerald", beginRepetition: "22nd", endRepetition: "45th", toAchieveRepetition: 24, lives: 3, statusCount: 0, livesLeft: 3, badgeAchieved: false, badgeAchievedDate: Date()),
    BadgeObject(index: 4, shape: "Gold", beginRepetition: "46th", endRepetition: "90th", toAchieveRepetition: 45, lives: 4, statusCount: 0, livesLeft: 4, badgeAchieved: false, badgeAchievedDate: Date())
    
]

struct BadgeReturnTemp_Previews: PreviewProvider {
    static var previews: some View {
        BadgeReturnTemp()
    }
}
