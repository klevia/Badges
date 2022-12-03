//
//  Star.swift
//  Badges
//
//  Created by Klevia Ulqinaku on 01.12.22.
//
import SwiftUI

struct Star : Shape {
    var points : Int = 5 // If it's not specified it's a 5-point star
    var innerRatio : Double = 0.2
     
    func path(in rect : CGRect) -> Path {
     
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
        let angle = Double.pi / Double(points)
        var path = Path()
        var startPoint = CGPoint(x: 0, y: 0)
 
        let outerRadius = center.x
        let innerRadius = outerRadius * innerRatio
        
        let maxCorners = 2 * points

        for corner in 0 ..< maxCorners {
            
            let radius = (corner % 2) == 0 ? outerRadius : innerRadius
            
            let x = center.x + CGFloat(cos(Double(corner) * angle)) * CGFloat (radius)
            let y = center.y + CGFloat(sin(Double(corner) * angle)) * CGFloat(radius)
            let point = CGPoint( x: x, y: y)
            
            if (corner == 0) {
                startPoint = point // store the starting point
                path.move(to:point )
            }
            else {
                path.addLine(to: point)
            }
            // move back to starting point
            if ( corner == (maxCorners - 1) ){
                path.addLine(to: startPoint)
            }
        }
        
        return path
    }
}
