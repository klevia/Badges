//
//  BadgeReturnTemp.swift
//  Badges
//
//  Created by Rishabh Maini on 03/12/22.
//

import SwiftUI
import Popovers

struct BadgeView: View {
    
    @AppStorage("badgeTutorialDone") var badgeTutorialDone : Bool = false
    @EnvironmentObject var badge: BadgeViewModel
  
    //@State var livesLeftTemp: Int = 10
    
    var body: some View {
        
        ZStack{
            
                Button(action:{
                
                    
                    withAnimation(){
                        badge.sheetPresented = true
                       
                    }
                }){
                   
                    CurrentBadge()
                        .popover(isPresented: $badge.sheetPresented){
                            
                            BadgeTray()
                        }
                        
                }
               
        }
        .onChange(of: badge.sheetPresented){value in
            
            if !badge.sheetPresented{
                
                badge.badgeEarnedPopup = false
                badge.dismissProgressLostPopUp()
                badgeTutorialDone = true
                
            }
        }
        
    }
}



struct CurrentBadge: View{
    
    @EnvironmentObject var badge: BadgeViewModel
  
    var body: some View{
        
        HStack(spacing: 2){
            
            BadgeImage(badgeItem: .constant(badge.minimizedBadge()), size: .constant(40))
           
            ZStack{
                TemporaryPopup()
                    .opacity(badge.heartLost ? 1 : 0)
                
                if badge.progressLostInBackground(lockedBadgeIndex: badge.minimizedBadge().index){
                    PermenantPopup()
                }
            }
                
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        
    }
}


struct BadgeReturnTemp_Previews: PreviewProvider {
    static var previews: some View {
        BadgeView()
    }
}

extension Date: RawRepresentable {
    private static let formatter = ISO8601DateFormatter()
    
    public var rawValue: String {
        Date.formatter.string(from: self)
    }
    
    public init?(rawValue: String) {
        self = Date.formatter.date(from: rawValue) ?? Date()
    }
}
