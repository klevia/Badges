//
//  ProgressLostPopup.swift
//  Badges
//
//  Created by Rishabh Maini on 04/12/22.
//

import SwiftUI

struct ProgressLostPopup: View {
    
    @Binding var rubyClicked : Bool
    @EnvironmentObject var badge: BadgeViewModel
    
    var body: some View {
        let lostBadge = badge.currentBadgesStatus.last(where: {$0.badgeAchieved == false})! //to be changed
        
        VStack{
            VStack(spacing: 1){
                
                    Text("Sleep 7-9 hours")
                        .font(.custom("Montserrat-Medium", size: 12))
                        .foregroundColor(.white)
                        .padding(.bottom,39)
                    
                    Image("BrokenHeart")
                        .resizable()
                        .aspectRatio( contentMode: .fit)
                        .frame(width: 98, height: 80,alignment: .center)
                        .opacity(0)
                        .background(
                            
                            LinearGradient(gradient: Gradient(stops: [
                                Gradient.Stop(color: Color(hue: lostBadge.endColor.hue,
                                                           saturation: lostBadge.endColor.saturation,
                                                           brightness: lostBadge.endColor.brightness), location: 0.0),
                                Gradient.Stop(color: Color(hue: lostBadge.midColor.hue,
                                                           saturation: lostBadge.midColor.saturation,
                                                           brightness: lostBadge.midColor.brightness), location: 0.5),
                                Gradient.Stop(color: Color(hue: lostBadge.endColor.hue,
                                                           saturation: lostBadge.endColor.saturation,
                                                           brightness: lostBadge.endColor.brightness), location: 1.0),
                            ]), startPoint: .leading, endPoint: .trailing)
                            .mask(
                                
                                Image("BrokenHeart")
                                    .resizable()
                                    .aspectRatio( contentMode: .fit)
                                
                            )
                            
                            
                        )
                
                Text("You ran out of misses")
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                    .padding(.top, 23)
                
                Text("On route 21st - 45th repetition, you missed the habit more than 4 times. Let's start again and stronger this time")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 14))
                    .foregroundColor(.white).opacity(0.5)
                    .padding(.horizontal,32)
                    .padding(.bottom,30)
                
                Button(action: {
                    rubyClicked.toggle()
                }){
                    Text("Close")
                        .foregroundColor(Color.black)
                        .background(Capsule()
                            .foregroundColor(.white)
                            .frame(width: 133,height: 50))
                        .padding(.bottom,16)
                }
            }
        }
       
        .padding(.vertical,32)
   
        .frame(maxWidth: .infinity)
        .background(RoundedRectangle(cornerRadius: 24)
            .fill(Color(hue: 0.5611, saturation: 1, brightness: 0.15)))
        .padding(.horizontal,16)
    }
    
}


