//
//  ProgressLostPopup.swift
//  Badges
//
//  Created by Rishabh Maini on 04/12/22.
//

import SwiftUI

struct ProgressLostPopup: View {
    
    @Binding var rubyClicked : Bool
    
    var body: some View {
        VStack{
            VStack(spacing: 5){
                HStack(spacing: 75){
                    Text("Sleep 7-9 hours")
                        .font(.system(size: 12))
                        .foregroundColor(.white)
                    
                    Button(action: {
                        rubyClicked.toggle()
                    }){
                        Image(systemName: "xmark.circle.fill")
                          //  .renderingMode(.original)
                          //  .foregroundColor(Color(.gray)).opacity(0.3)
                            .font(.system(size: 40))
                    }
                }
                .frame(maxWidth: .infinity,alignment: .trailing)
                .padding(.trailing,16)
                
                ZStack{
                    Polygon(sides : 6)
                        .rotation(Angle(degrees: 30))
                    //   .stroke(Color.blue, lineWidth: 3)
                        .shadow(color: .blue, radius: 30)
                        .frame(width: 150,height: 150,alignment: .leading)
                    
                    Image(systemName: "bolt.heart.fill")
                        .renderingMode(.original)
                        .foregroundColor(Color(hue: 0.56111, saturation: 1, brightness: 1))
                        .font(.system(size: 54))
                }
                
            
                
                Text("You ran out of misses")
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                    .padding(.top, 24)
                
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
                        .padding(.top,37)
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


