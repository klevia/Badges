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
                
                Image("Sapphire")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150, alignment: .center)
                    .shadow(color: .blue, radius: 30)
                
                Text("21 repetitions complete")
                    .font(.custom("Montserrat-Medium", size: 20))
                    .bold()
                    .foregroundColor(.white)
                    .padding(.top,19)
                
                Text("Earned on 25th Jan 2022")
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
       
        .padding(.vertical,32)
        .frame(maxWidth: .infinity)
        .background(RoundedRectangle(cornerRadius: 24).foregroundColor(Color.black.opacity(0.9)))
        .padding(.horizontal,16)
    }
    
}

