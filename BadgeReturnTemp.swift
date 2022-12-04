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



struct BadgeReturnTemp_Previews: PreviewProvider {
    static var previews: some View {
        BadgeReturnTemp()
    }
}
