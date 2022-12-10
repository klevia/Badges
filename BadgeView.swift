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
    @State var popover: Bool = true
    @State var livesLeftTemp: Int = 10
    
    var body: some View {
        
        ZStack{
            
                Button(action:{
                    
                    badge.currentBadgeStatus()
                    withAnimation(){
                        badge.sheetPresented = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                            //badgeTutorialDone = true
                        }
                    }
                }){
                    
                    CurrentBadge(popover: $popover, livesLeftTemp: $livesLeftTemp)
                        .popover(isPresented: $badge.sheetPresented){
                            
                            BadgeTray()
                        }
                        
                }
            
            
                
        }
        
    }
}



struct CurrentBadge: View{
    
    @EnvironmentObject var badge: BadgeViewModel
    @Binding var popover: Bool
    @Binding var livesLeftTemp: Int
    var body: some View{
        
        let minimizedBadge: BadgeObject = badge.minimizedBadge()
       
        HStack(spacing: 2){
            BadgeImage(badgeItem: .constant(minimizedBadge), size: .constant(40))
            if popover{
                Popup(livesLeftTemp: $livesLeftTemp)
            }
            
            
                
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        
        
    }
}

struct Popup: View{
    
    @Binding var livesLeftTemp: Int
    
    var body: some View{
        
        HStack(spacing: 0){
            LottieView(lottieFile: "Heart break")
                .frame(width: 32, height: 32)
                .zIndex(1)
            Text("\(livesLeftTemp)")
                //.padding(<#T##length: CGFloat##CGFloat#>)
                .foregroundColor(.black)
                .padding(.trailing, 4)
                .padding(.leading, -4)
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
}

struct BadgeReturnTemp_Previews: PreviewProvider {
    static var previews: some View {
        BadgeView()
    }
}
