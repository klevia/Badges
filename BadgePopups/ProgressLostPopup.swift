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
        let lostBadge = badges[3]
        //badge.currentBadgesStatus.last(where: {$0.badgeAchieved == false})! //to be changed
        
        VStack{
            VStack(spacing: 4){
                
                ZStack(){
                    Text("Sleep 7-9 hours")
                        .font(.custom("Montserrat-Medium", size: 14))
                        .foregroundColor(.white)
                    Button(action: {
                        rubyClicked.toggle()
                    }){
                        Image(systemName: "xmark")
                            .foregroundColor(Color(.white).opacity(0))
                            .font(.system(size: 16,weight: .light ,design: .rounded))
                            .padding(12)
                            .background(
                                Circle()
                                    .foregroundColor(Color.white.opacity(0))
                            )
                          
                            
                    }
                    .frame(maxWidth: .infinity,alignment: .trailing)
                  
                
 
                }
                .padding(.bottom,28)
                    
                    Image("BrokenHeart")
                        .resizable()
                        .aspectRatio( contentMode: .fit)
                        .frame(width: 105, height: 105,alignment: .center)
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
                    .font(.custom("Montserrat-Medium", size: 20))
                    .bold()
                    .foregroundColor(.white)
                    .padding(.top, 23)
                
                Text("On route of achiving the \(lostBadge.shape) Badge, you missed the habit more than \(lostBadge.lives) times. Let's start again and stronger this time")
                    .multilineTextAlignment(.center)
                    .font(.custom("Montserrat-Medium", size: 14))
                    .foregroundColor(.white).opacity(0.5)
                    .padding(.horizontal,16)
                    .padding(.bottom,24)
                
              Button(action: {
                    rubyClicked.toggle()
                }){
                    Text("Close")
                        .font(.custom("Montserrat-Medium", size: 16))
                        .foregroundColor(Color.black)
                        .padding()
                        .padding(.horizontal,16)
                        .background(Capsule()
                            .foregroundColor(.white))
                }
            }
        }
        .padding()
        .padding(.bottom,8)
        .frame(maxWidth: .infinity)
        .background(
            Image("\(lostBadge.shape)Background")
                .resizable()
                .mask(
                    
                    LinearGradient(gradient: Gradient(stops: [
                        Gradient.Stop(color: .white.opacity(0.45), location: 0),
                        Gradient.Stop(color: .white.opacity(0.3), location: 1)
                    ]), startPoint: .top, endPoint: .bottom)
                )
                .background(Color.black)
                .cornerRadius(24)
        )
        .padding(.horizontal,24)
    }
    
}


