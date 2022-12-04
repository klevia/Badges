//
//  BadgeReturnTemp.swift
//  Badges
//
//  Created by Rishabh Maini on 03/12/22.
//

import SwiftUI

struct BadgeView: View {
    
    @StateObject var badge: BadgeViewModel = BadgeViewModel()
    @State var sheetPresented: Bool = false
    var body: some View {
        
        ZStack{
            
            Color.black.ignoresSafeArea()
            
            Button(action:{
              // print(badge.currentBadgeStatus(defaultBadges: badges))
                //print(badge.currentBadgeStatus(defaultBadges: badges).count)
                print(badge.currentBadgeStatus(defaultBadges: badges))

                withAnimation(){
                    sheetPresented = true
                }
            }){
                
                CurrentBadge()
                    .popover(isPresented: $sheetPresented){
                        
                        BadgeTray()
                    }
                
            }
                
                
            
                
            
           
        }
        .environmentObject(badge)
    }
}

struct CurrentBadge: View{
    
    @EnvironmentObject var badge: BadgeViewModel
    
    var body: some View{
        
        let currentBadge = badge.currentBadgeStatus(defaultBadges: badges).first(where: {$0.badgeAchieved == false})!
        
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
}


struct BadgeReturnTemp_Previews: PreviewProvider {
    static var previews: some View {
        BadgeView()
    }
}
