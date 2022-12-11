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
                
                    
                    if (badge.heartLost) {
                        badge.heartLost = false
                        }
               
                    
                     badge.currentBadgeStatus()
                    withAnimation(){
                        badge.sheetPresented = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                            //badgeTutorialDone = true
                        }
                    }
                }){
                    
                    //CurrentBadge(popover: $popover, livesLeftTemp: $livesLeftTemp)
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
  
   // @Binding var livesLeftTemp: Int
    var body: some View{
        
        let minimizedBadge: BadgeObject = badge.minimizedBadge()
       
        HStack(spacing: 2){
            BadgeImage(badgeItem: .constant(minimizedBadge), size: .constant(40))
           
          // if badge.heartLost{
              //  Popup(livesLeftTemp: $livesLeftTemp)
                Popup()
                .opacity(badge.heartLost ? 1 : 0)
           // }
            
            
                
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        
        
    }
}

struct Popup: View{
    
    @State private var isPlay: Bool = true
    @EnvironmentObject var badge: BadgeViewModel
    
    
    var body: some View{
        
       
        ZStack{
            HStack(spacing: 0){
                // if(badge.heartLost){
                LottieView(isPlay: isPlay, lottieFile: "HeartBreak")
                    .frame(width: 32, height: 32)
                    .zIndex(1)
                //   .opacity(badge.heartLost ? 1 : 1)
                //}
                
                
                Text("\(badge.minimizedBadge().livesLeft)")
                    .foregroundColor(.black)
                    .padding(.trailing, 4)
                    .padding(.leading, -4)
                    .animation(.easeOut.delay(1.1), value: badge.minimizedBadge().livesLeft)
                
            }
            .padding(.horizontal, 8)
            .font(.system(size: 14, weight: .regular, design: .rounded))
            .frame(height: 36)
            .background(
                Image("Popup")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                //.offset(x: -2)
                    .opacity(1)
            )
        }
           .onChange(of: badge.heartLost){ value in
               if badge.heartLost{
                   isPlay = true
               }
               
               if !badge.heartLost{
                   DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                      
                           isPlay = false
                       
                   }
               }
            }
        
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
