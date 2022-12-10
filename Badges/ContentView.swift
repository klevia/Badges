//
//  ContentView.swift
//  Badges
//
//  Created by Klevia Ulqinaku on 01.12.22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var badge: BadgeViewModel = BadgeViewModel()
   

 
    
    var body: some View {
        
        ZStack{
            Color.black.ignoresSafeArea()
            
            HStack(spacing: 16){
                
                DoneButton(appendNumber: .constant(1), foregroundText: .constant("+1%"), color: .constant(.green))
                BadgeView()
                InactivityButton(appendNumber: .constant(0), foregroundText: .constant("0%"), color: .constant(.blue))
                MissedButton(appendNumber: .constant(-2), foregroundText: .constant("-1%"), color: .constant(.red))
                
            }
        }
        .environmentObject(badge)

       
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}






























/*Button(action:{
    withAnimation(){
        popover = true
        
    }
    DispatchQueue.main.asyncAfter(deadline: .now() + 1.1){
        withAnimation(){
            
            livesLeftTemp -= 1
        }
    }
    DispatchQueue.main.asyncAfter(deadline: .now() + 2){
        withAnimation(){
            popover = false
        }
    }
}){
    Text("Trigger Popover")
        .foregroundColor(.white)
        .padding()
        .background(Capsule())
}*/
