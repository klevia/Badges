//
//  BadgeIntroPopup.swift
//  Badges
//
//  Created by Rishabh Maini on 08/12/22.
//

import SwiftUI

struct BadgeIntroPopup: View {
    
    @State var presentPopover: Bool = true
    @AppStorage("badgeTutorialDone") var badgeTutorialDone : Bool = false
    @Binding var badgeTutorialDoneOnAppear : Bool
    
    var body: some View {
       
                    ZStack{
                        
                        Color(hue: 0, saturation: 0, brightness: 0.07).ignoresSafeArea()
                        
                        VStack(spacing:  16){
                            
                            HStack(spacing: 24){
                                
                                IntroBadgeImage(badgeImage: .constant("Amber"))
                                IntroBadgeImage(badgeImage: .constant("Quartz"))
                                IntroBadgeImage(badgeImage: .constant("Ruby"))
                                
                            }
                            
                            HStack(spacing: 24){
                                
                                IntroBadgeImage(badgeImage: .constant("Sapphire"))
                                IntroBadgeImage(badgeImage: .constant("Emerald"))
                                
                            }
                            
                            VStack(spacing: 8){
                                
                                Text("5 badges. 90 days.")
                                    .font(.custom("Montserrat-SemiBold", size: 22))
                                    
                                Text("Turn any activity that you wish to start doing, into a lifestyle that you'll never stop practicing.")
                                    .opacity(0.5)
                                    .font(.custom("Montserrat-Regular", size: 14))
                                
                            }
                            .padding(.horizontal, 40)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .padding(.top, 16)
                            
                        }
                        
                        Button(action:{
                            
                            withAnimation(){
                                badgeTutorialDoneOnAppear = true
                            }
                        }){
                            
                            Text("Continue")
                                .font(.custom("Montserrat-Medium", size: 18))
                                .foregroundColor(.white)
                                
                                
                                .frame(maxWidth: .infinity, minHeight: 60)
                                
                                .background(RoundedRectangle(cornerRadius: 24).foregroundColor(.blue).shadow(color: Color.black.opacity(0.5), radius: 8, y: 8))
                                .padding(.horizontal, 32)
                        }
                        .frame(maxHeight: .infinity, alignment: .bottom)
                        .padding(.bottom)
                    }

    }
    
}

private struct IntroBadgeImage: View{
    
    @Binding var badgeImage: String
    
    var body: some View{
        
        Image(badgeImage)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 90, height: 90)
    }
}


