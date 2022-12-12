//
//  BadgeViewModel.swift
//  Badges
//
//  Created by Rishabh Maini on 03/12/22.
//

import Foundation
import SwiftUI

class BadgeViewModel: ObservableObject{
   
    @Published var currentBadgesStatus: [BadgeObject] = badges
    @Published var statuses : [HabitArray] = habitEntries
    @Published var currentHabit: String = ""
    @Published var sheetPresented: Bool = false
    @Published var heartLost : Bool = false
    @Published var badgeEarnedPopup: Bool = false
    @Published var badgeProgressLostPopup: Bool = false
    @AppStorage("badgeProgressLostPopupLastSeen") var badgeProgressLostPopupLastSeen : Date = Date.distantPast
    
    func progressLostInBackground(lockedBadgeIndex: Int) -> (brokenHearts : Bool,redDot :Bool){
        
        var brokenHearts: Bool = false
        var redDot: Bool = false
        
        if !(badgeProgressLostPopupLastSeen > currentBadgesStatus[lockedBadgeIndex].progressLostInBackground){
            
            currentBadgesStatus[lockedBadgeIndex].redDotOnBadgeDueToInactivity = true
            redDot = true
            
            var filteredArray : [HabitArray] = []
            
            filteredArray =  statuses.filter({$0.timeStamp > currentBadgesStatus[lockedBadgeIndex].progressLostInBackground})
            
            //check if the habit was swiped after inactivity in background
            if !(filteredArray.filter({$0.status != 0 }).count > 0) {
                
                brokenHearts = true
                badgeProgressLostPopup = true
            }
        }
        
        return (brokenHearts,redDot)
    }
    
    func currentBadgeStatus(){
        
        currentBadgesStatus = badges
        
        
        for habitEntry in statuses{
            
            let lockedBadgeIndex = currentBadgesStatus.filter({$0.badgeAchieved == false})[0].index
            
            if habitEntry.status == 1{
                
                currentBadgesStatus[lockedBadgeIndex].statusCount += 1
                
                if currentBadgesStatus[lockedBadgeIndex].statusCount == currentBadgesStatus[lockedBadgeIndex].toAchieveRepetition{
                    
                    currentBadgesStatus[lockedBadgeIndex].badgeAchieved = true
                    currentBadgesStatus[lockedBadgeIndex].badgeAchievedDate = Date()
           
                }
                
            } else if (habitEntry.status == -2){
                
                if currentBadgesStatus[lockedBadgeIndex].livesLeft == 0{
                    
                    currentBadgesStatus[lockedBadgeIndex].statusCount = 0
                    currentBadgesStatus[lockedBadgeIndex].livesLeft = currentBadgesStatus[lockedBadgeIndex].lives
                   
                }else{
                    
                    currentBadgesStatus[lockedBadgeIndex].livesLeft -= 1
                    
                }
                
            } else if (habitEntry.status == 0){
                
                if currentBadgesStatus[lockedBadgeIndex].livesLeft == 0{
                    
                    currentBadgesStatus[lockedBadgeIndex].statusCount = 0
                    currentBadgesStatus[lockedBadgeIndex].livesLeft = currentBadgesStatus[lockedBadgeIndex].lives
                    currentBadgesStatus[lockedBadgeIndex].progressLostInBackground = habitEntry.timeStamp
                    
                }else{
                    
                    currentBadgesStatus[lockedBadgeIndex].livesLeft -= 1
                }
            }
            
        }
        
    }
    
    func minimizedBadge() -> BadgeObject{
        
        var currentBadgesStatusMB = badges
        
        for habitEntry in statuses{
        
            let lockedBadgeIndex = currentBadgesStatusMB.filter({$0.badgeAchieved == false})[0].index
            
            if habitEntry.status == 1{
                
                currentBadgesStatusMB[lockedBadgeIndex].statusCount += 1
                
                if currentBadgesStatusMB[lockedBadgeIndex].statusCount == currentBadgesStatusMB[lockedBadgeIndex].toAchieveRepetition{
                    currentBadgesStatusMB[lockedBadgeIndex].badgeAchieved = true
                }
                
            } else if (habitEntry.status == -2){
                
                if currentBadgesStatusMB[lockedBadgeIndex].livesLeft == 0{
                    
                    currentBadgesStatusMB[lockedBadgeIndex].statusCount = 0
                    currentBadgesStatusMB[lockedBadgeIndex].livesLeft = currentBadgesStatusMB[lockedBadgeIndex].lives
                   
                }else{
                    
                    currentBadgesStatusMB[lockedBadgeIndex].livesLeft -= 1
                    
                }
                
            } else if (habitEntry.status == 0){
                
                if currentBadgesStatusMB[lockedBadgeIndex].livesLeft == 0{
                    
                    currentBadgesStatusMB[lockedBadgeIndex].statusCount = 0
                    currentBadgesStatusMB[lockedBadgeIndex].livesLeft = currentBadgesStatusMB[lockedBadgeIndex].lives
                    currentBadgesStatusMB[lockedBadgeIndex].progressLostInBackground = habitEntry.timeStamp
                    
                }else{
                    
                    currentBadgesStatusMB[lockedBadgeIndex].livesLeft -= 1
                }
            }
            
        }
        
        
        
        return currentBadgesStatusMB.filter({$0.badgeAchieved == false})[0]
    }
    
    func dismissProgressLostPopUp(){
        
        if badgeProgressLostPopup{
            badgeProgressLostPopup = false
            badgeProgressLostPopupLastSeen = Date()
            
        }
    }
    
    func formattedDate(badgeAchievedDate: Date) -> String{
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        
        let returnString = "Earned on \(dateFormatter.string(from: badgeAchievedDate))"
        return returnString
        
    }
    
 
    

    
    
    
    
    
}
