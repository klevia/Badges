//
//  BadgeViewModel.swift
//  Badges
//
//  Created by Rishabh Maini on 03/12/22.
//

import Foundation
import SwiftUI

class BadgeViewModel: ObservableObject{
    
    let statuses: [Int] = [1,1,1,1,1,1,1,-2,-2,1,1,1]
    
    func currentBadgeStatus(defaultBadges: [BadgeObject]) -> [BadgeObject]{
        
        var currentBadgesStatus: [BadgeObject] = defaultBadges
        
        for status in statuses{
            
            var lockedBadgeIndex = currentBadgesStatus.filter({$0.badgeAchieved == false})[0].index
            
            if status == 1{
                
                currentBadgesStatus[lockedBadgeIndex].statusCount += 1
                
                if currentBadgesStatus[lockedBadgeIndex].statusCount == currentBadgesStatus[lockedBadgeIndex].toAchieveRepetition{
                    currentBadgesStatus[lockedBadgeIndex].badgeAchieved = true
                }
                
            } else if (status == -2){
                print("Status = -2")
                print(currentBadgesStatus[lockedBadgeIndex].livesLeft)
                if currentBadgesStatus[lockedBadgeIndex].livesLeft == 0{
                    
                    currentBadgesStatus[lockedBadgeIndex].statusCount = 0
                    currentBadgesStatus[lockedBadgeIndex].livesLeft = currentBadgesStatus[lockedBadgeIndex].lives
                    print("firstOne")
                    
                }else{
                    
                    currentBadgesStatus[lockedBadgeIndex].livesLeft -= 1
                    print("secondOne")
                    
                }
                
            }
            
        }
        print(currentBadgesStatus)
        
        return currentBadgesStatus
    }
}
