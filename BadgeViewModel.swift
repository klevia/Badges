//
//  BadgeViewModel.swift
//  Badges
//
//  Created by Rishabh Maini on 03/12/22.
//

import Foundation
import SwiftUI

class BadgeViewModel: ObservableObject{
    
    let statuses: [Int] = [1,1,1,1,1,1,1,-2,-2,1,1,1,-2,-2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
    @Published var currentBadgesStatus: [BadgeObject] = badges
    
    func currentBadgeStatus(){
        
        currentBadgesStatus = badges
        
        for status in statuses{
            
            let lockedBadgeIndex = currentBadgesStatus.filter({$0.badgeAchieved == false})[0].index
            
            if status == 1{
                
                currentBadgesStatus[lockedBadgeIndex].statusCount += 1
                
                if currentBadgesStatus[lockedBadgeIndex].statusCount == currentBadgesStatus[lockedBadgeIndex].toAchieveRepetition{
                    currentBadgesStatus[lockedBadgeIndex].badgeAchieved = true
                }
                
            } else if (status == -2){
                
                if currentBadgesStatus[lockedBadgeIndex].livesLeft == 0{
                    
                    currentBadgesStatus[lockedBadgeIndex].statusCount = 0
                    currentBadgesStatus[lockedBadgeIndex].livesLeft = currentBadgesStatus[lockedBadgeIndex].lives
                   
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
        
        return currentBadgesStatusMB.filter({$0.badgeAchieved == false})[0]
    }
    
    func formattedDate(badgeAchievedDate: Date) -> String{
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        
        let returnString = "Earned on \(dateFormatter.string(from: badgeAchievedDate))"
        return returnString
        
    }
}
