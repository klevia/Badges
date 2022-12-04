//
//  BadgeViewModel.swift
//  Badges
//
//  Created by Rishabh Maini on 03/12/22.
//

import Foundation
import SwiftUI

class BadgeViewModel: ObservableObject{
    
    let statuses: [Int] = [1,1,1,1,1,1,1,-2,-2,1,1,1,-2,-2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
    
    func currentBadgeStatus(defaultBadges: [BadgeObject]) -> [BadgeObject]{
        
        var currentBadgesStatus: [BadgeObject] = defaultBadges
        
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
        
        return currentBadgesStatus
    }
}
