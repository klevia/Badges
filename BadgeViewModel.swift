//
//  BadgeViewModel.swift
//  Badges
//
//  Created by Rishabh Maini on 03/12/22.
//

import Foundation
import SwiftUI

class BadgeViewModel: ObservableObject{
   
    @Published var statuses: [Int] = habitEntries.map({$0.status})  //[1,1,1,1]//[1,1,1,1,1,1,1,-2,-2,1,1,1,-2,-2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
    @Published var currentBadgesStatus: [BadgeObject] = badges
    @Published var currentHabit: String = ""
    @Published var sheetPresented: Bool = false
    @Published var heartLost : Bool = false
    @Published var badgeEarnedPopup: Bool = false
    @Published var badgeProgressLostPopup: Bool = false
    @AppStorage("badgeProgressLostPopupLastSeen") var badgeProgressLostPopupLastSeen : Date = Date.distantPast
    
    
    func currentBadgeStatus(){
        
        currentBadgesStatus = badges
        
        for status in statuses{
            
            let lockedBadgeIndex = currentBadgesStatus.filter({$0.badgeAchieved == false})[0].index
            
            if status == 1{
                
                currentBadgesStatus[lockedBadgeIndex].statusCount += 1
                
                if currentBadgesStatus[lockedBadgeIndex].statusCount == currentBadgesStatus[lockedBadgeIndex].toAchieveRepetition{
                    
                    currentBadgesStatus[lockedBadgeIndex].badgeAchieved = true
                    currentBadgesStatus[lockedBadgeIndex].badgeAchievedDate = Date()
           
                }
                
            } else if (status == -2){
                
                if currentBadgesStatus[lockedBadgeIndex].livesLeft == 0{
                    
                    currentBadgesStatus[lockedBadgeIndex].statusCount = 0
                    currentBadgesStatus[lockedBadgeIndex].livesLeft = currentBadgesStatus[lockedBadgeIndex].lives
                   
                }else{
                    
                    currentBadgesStatus[lockedBadgeIndex].livesLeft -= 1
                    
                }
                
            } else if (status == 0){
                if currentBadgesStatus[lockedBadgeIndex].livesLeft == 0{
                    
                    currentBadgesStatus[lockedBadgeIndex].statusCount = 0
                    currentBadgesStatus[lockedBadgeIndex].livesLeft = currentBadgesStatus[lockedBadgeIndex].lives
                    currentBadgesStatus[lockedBadgeIndex].progressLostInBackground = Date()
                    
                }else{
                    currentBadgesStatus[lockedBadgeIndex].livesLeft -= 1
                }
            }
            
        }
        
    }
    
    func minimizedBadge() -> BadgeObject{
        
        var currentBadgesStatusMB = badges
        
        for status in statuses{
            
            let lockedBadgeIndex = currentBadgesStatusMB.filter({$0.badgeAchieved == false})[0].index
            
            if status == 1{
                
                currentBadgesStatusMB[lockedBadgeIndex].statusCount += 1
                
                if currentBadgesStatusMB[lockedBadgeIndex].statusCount == currentBadgesStatusMB[lockedBadgeIndex].toAchieveRepetition{
                    currentBadgesStatusMB[lockedBadgeIndex].badgeAchieved = true
                }
                
            } else if (status == -2){
                
                if currentBadgesStatusMB[lockedBadgeIndex].livesLeft == 0{
                    
                    currentBadgesStatusMB[lockedBadgeIndex].statusCount = 0
                    currentBadgesStatusMB[lockedBadgeIndex].livesLeft = currentBadgesStatusMB[lockedBadgeIndex].lives
                   
                }else{
                    
                    currentBadgesStatusMB[lockedBadgeIndex].livesLeft -= 1
                    
                }
                
            }
            
        }
        
        return currentBadgesStatusMB.filter({$0.badgeAchieved == false})[0] // This returns false when all badges become full
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
