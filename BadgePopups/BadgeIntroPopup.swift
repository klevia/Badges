//
//  BadgeIntroPopup.swift
//  Badges
//
//  Created by Rishabh Maini on 04/12/22.
//

import SwiftUI

struct BadgeIntroPopup: View {
    
    @Binding var triangleClicked : Bool
    
    var body: some View {
        VStack{
            VStack(spacing: 5){
                
                HStack(spacing: 10){
                    Polygon(sides : 3)
                        .rotation(Angle(degrees: 30))
                        .fill(Color(.yellow))
                        .padding(.top,20)
                        .frame(width: 75,height: 75,alignment: .center)
                   
                       
                    
                    Polygon(sides : 4)
                        .fill(Color(.orange))
                        .frame(width: 70,height: 70,alignment: .center)
                    
                    Polygon(sides : 5)
                        .rotation(Angle(degrees: 55))
                        .fill(Color(.green))
                        .frame(width: 70,height: 70,alignment: .center)
                }
                .frame(maxWidth: .infinity,alignment: .center)
                .padding(.horizontal,32)
                HStack(spacing: 10){
                    Polygon(sides : 6)
                        .rotation(Angle(degrees: 30))
                        .fill(Color(.systemBlue))
                        .frame(width: 70,height: 70,alignment: .leading)
                    
                    Polygon(sides : 7)
                        .rotation(Angle(degrees: 14))
                        .fill(Color(.systemPurple))
                        .frame(width: 70,height: 70,alignment: .leading)
                    
                   
                }
                .frame(maxWidth: .infinity,alignment: .center)
 
                .padding(.horizontal,32)
                .padding(.bottom,20)
                
                Text("90 days. 5 badges")
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                    .padding(.top,24)
                Text("Turn any activity that you wish to start doing, into a lifestyle that you can't stop. Along the we'll reward you with some sparkling badges.")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 14))
                    .foregroundColor(.white).opacity(0.5)
                    .padding(.horizontal,32)
                   
                
                Button(action: {
                    triangleClicked.toggle()
                }){
                    Text("Close")
                        .foregroundColor(Color.black)
                        .background(Capsule()
                            .foregroundColor(.white)
                            .frame(width: 133,height: 50))
                        .padding(.top,40)
                       
                }
            }
        }
       
        .padding(.vertical,32)
   
        .frame(maxWidth: .infinity)
       
    
        .background(Color(hue: 0, saturation: 0, brightness: 0.15))
        .padding(.horizontal,16)
    }
    
}

