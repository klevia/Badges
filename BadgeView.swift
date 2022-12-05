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
            
            Color.white.ignoresSafeArea()
            
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
       
        BadgeImage(badgeItem: .constant(minimizedBadge), size: .constant(200))
        
    }
}


struct BadgeReturnTemp_Previews: PreviewProvider {
    static var previews: some View {
        BadgeView()
    }
}
