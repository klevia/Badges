//
//  HeartGradient.swift
//  Badges
//
//  Created by Rishabh Maini on 04/12/22.
//

import SwiftUI

struct HeartGradient: View {
    var body: some View {
        
        ZStack{
            
            Color.black.ignoresSafeArea()
            
            
            
            
            Image("Heart")
                .resizable()
                .aspectRatio( contentMode: .fit)
                .opacity(0)
                
                .background(
                
                    LinearGradient(gradient: Gradient(stops: [
                            Gradient.Stop(color: Color(hex: "0A0A0A"), location: 0),
                            Gradient.Stop(color: Color(hex: "FFFFFF"), location: 0.5),
                            Gradient.Stop(color: Color(hex: "FFFAAA"), location: 1)
                        ]), startPoint: .leading, endPoint: .trailing)
                    .mask(
                        
                        Image("Heart")
                            .resizable()
                            .aspectRatio( contentMode: .fit)
                        
                    )
                
                
                )
                
                
            
                
                
            
            
        }
    }
}

struct HeartGradient_Previews: PreviewProvider {
    static var previews: some View {
        HeartGradient()
    }
}
