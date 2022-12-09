//
//  AppendButton.swift
//  Badges
//
//  Created by Rishabh Maini on 09/12/22.
//

import SwiftUI

struct DoneButton: View{
    
    @Binding var appendNumber: Int
    @Binding var foregroundText: String
    @Binding var color: Color
    @EnvironmentObject var badge: BadgeViewModel
    @AppStorage("badgeTutorialDone") var badgeTutorialDone : Bool = false
    var body: some View{
        
        
        
        Button(action:{
            
            withAnimation(){
                badge.statuses.append(1)
                if badge.minimizedBadge().statusCount == 0{
                    withAnimation(){
                        
                        badge.sheetPresented = true
                        //Badge earned Popup
                        
                    }
                }
                if !badgeTutorialDone{
                    
                    withAnimation(){
                        
                        badge.sheetPresented = true
                        
                    }
                }
            }
            
        }){
            
            Text(foregroundText)
                .foregroundColor(color)
                .padding(24)
                .background(Circle().foregroundColor(.white.opacity(0.1)))
        }
        
    }
}

struct MissedButton: View{
    
    @Binding var appendNumber: Int
    @Binding var foregroundText: String
    @Binding var color: Color
    @EnvironmentObject var badge: BadgeViewModel
    @AppStorage("badgeTutorialDone") var badgeTutorialDone : Bool = false
    
    var body: some View{
        
        Button(action:{
            
            withAnimation(){
                
                if (badge.minimizedBadge().livesLeft == 0){
                    withAnimation(){
                        
                        badge.sheetPresented = true
                        //Badge progress Lost popup Popup
                        
                    }
                    
                } else{
                    
                    //Lottie animation
                }
                if !badgeTutorialDone{
                    
                    withAnimation(){
                        
                        badge.sheetPresented = true
                        
                    }
                }

                badge.statuses.append(-2)
               
            }
            
        }){
            
            Text(foregroundText)
                .foregroundColor(color)
                .padding(24)
                .background(Circle().foregroundColor(.white.opacity(0.1)))
        }
        
    }
}




