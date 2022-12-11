//
//  HeartGradient.swift
//  Badges
//
//  Created by Rishabh Maini on 04/12/22.
//

import SwiftUI

struct BrokenHeartGradient: View {
    var body: some View {
            
            Image("BrokenHeart")
                .resizable()
                .aspectRatio( contentMode: .fit)
                .opacity(0)
                .background(
                
                    LinearGradient(gradient: Gradient(stops: [
                        Gradient.Stop(color: Color(hue: badges[2].endColor.hue, saturation: badges[2].endColor.saturation, brightness: badges[2].endColor.brightness), location: 0),
                            Gradient.Stop(color: Color(hue: badges[2].midColor.hue, saturation: badges[2].midColor.saturation, brightness: badges[2].midColor.brightness), location: 0.5),
                            Gradient.Stop(color: Color(hue: badges[2].endColor.hue, saturation: badges[2].endColor.saturation, brightness: badges[2].endColor.brightness), location: 1)
                        ]), startPoint: .leading, endPoint: .trailing)
                    .mask(
                        
                        Image("BrokenHeart")
                            .resizable()
                            .aspectRatio( contentMode: .fit)
                        
                    )
                
                )
        
    }
}


