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
            VStack(spacing: 4){
                
                HStack(spacing: 16){
                    Image("Amber")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80, height: 80, alignment: .center)
                    
                    Image("Quartz")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80, height: 80, alignment: .center)
                    
                    Image("Ruby")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80, height: 80, alignment: .center)
                }
                .frame(maxWidth: .infinity,alignment: .center)
                .padding(.horizontal,32)
                
                HStack(spacing: 16){
                    Image("Sapphire")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80, height: 80, alignment: .center)
                        .scaleEffect(y:1.04)
                    Image("Emerald")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80, height: 80, alignment: .center)
                      
                    
                   
                }
                .frame(maxWidth: .infinity,alignment: .center)
                .padding(.horizontal,32)
                .padding(.bottom,20)
                
                Text("90 days. 5 badges")
                    .font(.custom("Montserrat-Medium", size: 20))
                    .bold()
                    .foregroundColor(.white)
                Text("Turn any activity that you wish to start doing, into a lifestyle that you can't stop. Along the we'll reward you with some sparkling badges.")
                    .multilineTextAlignment(.center)
                    .lineLimit(3)
                    .minimumScaleFactor(0.5)
                    .font(.custom("Montserrat-Medium", size: 12))
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
                        .padding(.top,36)
                        .padding(.bottom,16)
                       
                }
            }
        }
        .padding(.vertical,32)
        .frame(maxWidth: .infinity)
        .background(RoundedRectangle(cornerRadius: 24).foregroundColor(Color.black.opacity(0.9)))
        .padding(.horizontal,24)
    }
    
}

