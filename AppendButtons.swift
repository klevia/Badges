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
               
                habitEntries.append(HabitArray(status: 1, timeStamp: Date(rawValue: (habitEntries.last?.timeStamp.addDay(day: 1))!.rawValue) ?? Date()))
                
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
            
               
                
                if (badge.minimizedBadge().livesLeft == 0){
                    withAnimation(){
                        
                        badge.sheetPresented = true
                        badge.badgeProgressLostPopup = true
                        
                    }
                    
                } else{
                    
                    withAnimation(){
                        badge.heartLost = true
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                        withAnimation(){
                            badge.heartLost = false
                        }
                    }
                    
                }
                if !badgeTutorialDone{
                    
                    withAnimation(){
                        
                        badge.sheetPresented = true
                        //This could also be in an onChange of swipeArray
                    }
                }

            habitEntries.append(HabitArray(status: -2, timeStamp: Date(rawValue: (habitEntries.last?.timeStamp.addDay(day: 1))!.rawValue) ?? Date()))
               
            
            
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
                
                
                if (badge.minimizedBadge().livesLeft == 0){
                    
                   // print(badge.minimizedBadge().progressLostInBackground)
                  
                        
                    }
                    
                }
           
            print(badge.minimizedBadge().progressLostInBackground)

                
            
        }){
            
            Text(foregroundText)
                .foregroundColor(color)
                .padding(24)
                .background(Circle().foregroundColor(.white.opacity(0.1)))
        }
        
    }
}




