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
               
                badge.currentBadgeStatus()
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
        
        let minimizedBadge: BadgeObject = badge.minimizedBadge()
        
        Image("\(minimizedBadge.shape)")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .opacity(0.25)
        .frame(height: 200)
        .overlay(
            
            Image("\(minimizedBadge.shape)")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .mask(
                    Color.white.opacity(1)
                        .frame(height: CGFloat((Double(minimizedBadge.statusCount)/Double(minimizedBadge.toAchieveRepetition)))*200.0)
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
