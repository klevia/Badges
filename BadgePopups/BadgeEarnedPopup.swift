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
        
        
        VStack{
            VStack(spacing: 4){
                HStack(spacing: 72){
                    Text("Sleep 7-9 hours")
                        .font(.custom("Montserrat-Medium", size: 12))
                        .foregroundColor(.white)
                    
                    Button(action: {
                        goldClicked.toggle()
                    }){
                        Image(systemName: "x.circle.fill")
                            .renderingMode(.original)
                            .foregroundColor(Color(.gray)).opacity(0.3)
                            .font(.system(size: 40))
                    }
                }
                .frame(maxWidth: .infinity,alignment: .trailing)
                .padding(.trailing,16)
                
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
                        .background(Capsule()
                            .foregroundColor(.white)
                            .frame(width: 180,height: 50))
                        .padding(.bottom,16)
                }
            }
        }
       
        .padding(.bottom,32)
        
        .frame(maxWidth: .infinity)
        .background(
            
              //  RoundedRectangle(cornerRadius: 24)
                //    .foregroundColor(Color.black.opacity(0.9))
                Image("\(achievedBadge.shape)Background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .background(Color.black.opacity(0.9))
               
            ) //.foregroundColor(Color.black.opacity(0.9)))
        .cornerRadius(24)
        .padding(.horizontal,24)
        
    }
    
}

