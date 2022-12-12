//
//  Popups.swift
//  Badges
//
//  Created by Rishabh Maini on 11/12/22.
//

import SwiftUI

struct TemporaryPopup: View{
    
    @State private var isPlay: Bool = false
    @EnvironmentObject var badge: BadgeViewModel
    
    var body: some View{
        
        ZStack{
            
            HStack(spacing: 0){
                
                LottieView(isPlay: isPlay, lottieFile: "HeartBreak")
                    .frame(width: 32, height: 32)
                    .zIndex(1)
                
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

struct PermenantPopup: View{
    
    @EnvironmentObject var badge: BadgeViewModel
    
    var body: some View{
        
        HStack(spacing: 4){
            
           BrokenHeartGradient()
                .frame(width: 18, height: 18)
                .padding(.vertical, 8)
                .padding(.leading, 4)
                
            Text("0")
                .foregroundColor(.black)
                
            
        }
        .padding(.horizontal, 8)
        .font(.system(size: 16, weight: .regular, design: .rounded))
        .frame(height: 40)
        .background(
            
            Image("Popup")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(1)
            
        )
        
    }
}


struct Popups_Previews: PreviewProvider {
    static var previews: some View {
        TemporaryPopup()
    }
}
