//
//  BadgeEarnedPopup.swift
//  Badges
//
//  Created by Rishabh Maini on 04/12/22.
//

import SwiftUI

struct BadgeEarnedPopup: View {
    
    @Binding var goldClicked : Bool
    @EnvironmentObject var badge: BadgeViewModel
    
    var body: some View {
        
        let achievedBadge = badge.currentBadgesStatus.last(where: {$0.badgeAchieved == true})!
        let substring = String(achievedBadge.endRepetition.dropLast(2))
        
        
        VStack(){
            VStack(spacing: 4){
                
                ZStack(){
                    Text("Sleep 7-9 hours")
                        .font(.custom("Montserrat-Medium", size: 12))
                        .foregroundColor(.white)
                    
                    Button(action: {
                        goldClicked.toggle()
                    }){
                        Image(systemName: "xmark")
                            .foregroundColor(Color(.white))
                            .font(.system(size: 16,weight: .light ,design: .rounded))
                            .padding(12)
                            .background(
                                Circle()
                                    .foregroundColor(Color.white.opacity(0.1))
                            )
                          
                            
                    }
                    .frame(maxWidth: .infinity,alignment: .trailing)
                    .padding(.trailing,16)
                
 
                }
                .padding(.bottom,15)
             
                Image("\(achievedBadge.shape)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150, alignment: .center)
                    .shadow(color: Color(hue: achievedBadge.midColor.hue, saturation: achievedBadge.midColor.saturation, brightness: achievedBadge.midColor.brightness), radius: 30)
                
                Text("\(substring) repetitions complete")
                    .font(.custom("Montserrat-Medium", size: 20))
                    .bold()
                    .foregroundColor(.white)
                    .padding(.top,19)
                
                Text("\(badge.formattedDate(badgeAchievedDate: achievedBadge.badgeAchievedDate))")
                    .font(.custom("Montserrat-Medium", size: 14))
                    .foregroundColor(.white).opacity(0.5)
                    .padding(.horizontal,32)
                    .padding(.bottom,35)
                
                Button(action: {
                    goldClicked.toggle()
                }){
                    Text("Tell a friend")
                        .font(.custom("Montserrat-Medium", size: 16))
                        .foregroundColor(Color.black)
                        .padding()
                        .padding(.horizontal,16)
                        .background(Capsule()
                            .foregroundColor(.white))
                       
                }
            
            }
        }
        .padding(.bottom,16)
        .padding(.vertical,16)
        .frame(maxWidth: .infinity)
        .background(
            
              //  RoundedRectangle(cornerRadius: 24)
                //    .foregroundColor(Color.black.opacity(0.9))
                Image("\(achievedBadge.shape)Background")
                    .resizable()
                    .cornerRadius(24)
           
               
            )
        .padding(.horizontal,16)
    }
    
}

