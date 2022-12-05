//
//  BadgeImage.swift
//  Badges
//
//  Created by Rishabh Maini on 05/12/22.
//

import SwiftUI

struct BadgeImage: View {
    
    @Binding var badgeItem: BadgeObject
    @Binding var size: CGFloat
    
    var body: some View {
        
        
        Image("\(badgeItem.shape)")
            .renderingMode(.template)
            .resizable()
            .aspectRatio(contentMode: .fit)
            
            .opacity(0)
            .background(
            
                LinearGradient(gradient: Gradient(stops: [
                    Gradient.Stop(color: Color(hue: badgeItem.endColor.hue,
                                               saturation: badgeItem.endColor.saturation,
                                               brightness: 0.25), location: 0.0),
                    Gradient.Stop(color: Color(hue: badgeItem.midColor.hue,
                                               saturation: badgeItem.midColor.saturation,
                                               brightness: 0.25), location: 0.5),
                    Gradient.Stop(color: Color(hue: badgeItem.endColor.hue,
                                               saturation: badgeItem.endColor.saturation,
                                               brightness: 0.25), location: 1.0),
                    ]), startPoint: .leading, endPoint: .trailing)
                .mask(
                    Image("\(badgeItem.shape)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        
                        
                )
                
            )
            .opacity(0.85)
            .overlay(
                
                Image("\(badgeItem.shape)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .mask(
                        Color.white.opacity(1)
                        .frame(height: CGFloat((Double(badgeItem.statusCount)/Double(badgeItem.toAchieveRepetition)))*size)
                        .frame(maxHeight: .infinity, alignment: .bottom)
                    )
                    
            )
            .frame(width:size,height: size)
        
          
                
    }
}


