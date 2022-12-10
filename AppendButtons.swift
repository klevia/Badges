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
               
                if (badge.heartLost) {
                    badge.heartLost = false
                }
             
                
                badge.statuses.append(1)
                if badge.minimizedBadge().statusCount == 0{
                   
                        
                        badge.sheetPresented = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
                            badge.badgeEarnedPopup = true
                        }
                     
                }
                if !badgeTutorialDone{
                    
                    withAnimation(){
                        
                        badge.sheetPresented = true
                        //This could also be in an onChange of swipeArray
                        
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
                badge.heartLost = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                    withAnimation(){
                        badge.heartLost = false
                    }
                }
                
                if (badge.minimizedBadge().livesLeft == 0){
                    withAnimation(){
                        
                        badge.sheetPresented = true
                        //Badge progress Lost popup Popup
                        badge.heartLost = false
                        
                    }
                    
                } else{
                    
                    //Lottie animation
                }
                if !badgeTutorialDone{
                    
                    withAnimation(){
                        
                        badge.sheetPresented = true
                        //This could also be in an onChange of swipeArray
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

struct InactivityButton: View{
    
    @Binding var appendNumber: Int
    @Binding var foregroundText: String
    @Binding var color: Color
    @EnvironmentObject var badge: BadgeViewModel
    
    var body: some View{
        
        Button(action:{
            
            withAnimation(){
                
                
                if (badge.heartLost) {
                    badge.heartLost = false
                }
                
                if (badge.minimizedBadge().livesLeft == 0){
                    
                   // print(badge.minimizedBadge().progressLostInBackground)
                  
                        
                    }
                    
                }
           
            print(badge.minimizedBadge().progressLostInBackground)

                badge.statuses.append(0)

            
        }){
            
            Text(foregroundText)
                .foregroundColor(color)
                .padding(24)
                .background(Circle().foregroundColor(.white.opacity(0.1)))
        }
        
    }
}




