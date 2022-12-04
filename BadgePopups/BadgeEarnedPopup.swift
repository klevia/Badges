//
//  BadgeEarnedPopup.swift
//  Badges
//
//  Created by Rishabh Maini on 04/12/22.
//

import SwiftUI

struct BadgeEarnedPopup: View {
    
    @Binding var goldClicked : Bool
    
    var body: some View {
        VStack{
            VStack(spacing: 5){
                HStack(spacing: 75){
                    Text("Sleep 7-9 hours")
                        .font(.system(size: 12))
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
                
                Polygon(sides : 6)
                    .rotation(Angle(degrees: 30))
                    .fill(Color(.systemBlue))
                    .shadow(color: .blue, radius: 30)
                    .frame(width: 150,height: 150,alignment: .leading)
                
            
                
                Text("21 repetitions complete")
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                Text("Earned on 25th Jan 2022")
                    .font(.system(size: 14))
                    .foregroundColor(.white).opacity(0.5)
                    .padding(.horizontal,32)
                    .padding(.bottom,30)
                
                Button(action: {
                    goldClicked.toggle()
                }){
                    Text("Tell a friend")
                        .foregroundColor(Color.black)
                        .background(Capsule()
                            .foregroundColor(.white)
                            .frame(width: 180,height: 50))
                }
            }
        }
       
        .padding(.vertical,32)
   
        .frame(maxWidth: .infinity)
       
    
        .background(Color(hue: 0.5611, saturation: 1, brightness: 0.15))
        .padding(.horizontal,16)
    }
    
}

