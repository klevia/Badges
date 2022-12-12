//
//  BadgeTray.swift
//  Badges
//
//  Created by Rishabh Maini on 04/12/22.
//

import SwiftUI

struct BadgeTray: View {
    
    @AppStorage("badgeTutorialDone") var badgeTutorialDone : Bool = false // Take this to an environmentObject later on
    @State var badgeTutorialDoneOnAppear: Bool = false
    @State var triangleClicked = false
    @State var goldClicked = false
    
    @EnvironmentObject var badge: BadgeViewModel
    @State var playConfetti: Bool = false
   
    var body: some View {
        
        ZStack{
            
            ZStack{
                
                Color(hue: 0, saturation: 0, brightness: 0.07) // Replace this with Color(hex: "121212)
                    .ignoresSafeArea()
                
                ScrollView(showsIndicators: false){
                    ZStack(alignment: .top){
                        
                        BadgeBackground()
                        
                        VStack(spacing: 0){
                            
                            TrayHeading()
                            MainBadge()
                            CurrentBadgeSubHeading()
                            BadgeTrayList(triangleClicked: $triangleClicked, goldClicked: $goldClicked)
                        }
                    }
                }
            }.overlay(
                
                Button(action: {
                    badge.sheetPresented = false
                }){
                    Image(systemName: "xmark")
                        .foregroundColor(.black.opacity(0.65))
                        .font(.system(size: 16,weight: .light ,design: .rounded))
                        .padding(12)
                        .background(
                            Circle()
                                .foregroundColor(Color.black.opacity(0.1))
                        )
                }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                    .padding(.top, 16)
                    .padding(.trailing,16))
            .overlay(
                
                Color.black.opacity((badge.badgeEarnedPopup.boolean || badge.badgeProgressLostPopup) ? 0.5 : 0)
                    
                    .onTapGesture {
                        
                        withAnimation(){
                            badge.badgeEarnedPopup.boolean = false
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                                badge.badgeEarnedPopup.index = nil
                            }
                            badge.dismissProgressLostPopUp()
                        }
                        
                    }
                
            )
            
            .overlay(badge.badgeEarnedPopup.boolean ? BadgeEarnedPopup() : nil)
            .overlay(badge.badgeProgressLostPopup ? ProgressLostPopup() : nil)
            
            if !badgeTutorialDone{
                
                BadgeIntroPopup()
                    .zIndex(1)
                    .transition(.move(edge: .bottom))
            }
            
            //if playConfetti{
                
                    
           // }
                
            
        }
        .onAppear{
           
            badge.currentBadgeStatus()
          
        }
            
    }
}

struct BadgeBackground: View{
    
    @EnvironmentObject var badge: BadgeViewModel
    
    var body: some View{
        
        
        let currentBadge = badge.currentBadgesStatus.first(where: {$0.badgeAchieved == false})!
        
        Image("\(currentBadge.shape)Background")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .mask(
                
                LinearGradient(gradient: Gradient(stops: [
                    Gradient.Stop(color: .white, location: 0),
                    Gradient.Stop(color: .white.opacity(0), location: 0.85),
                    Gradient.Stop(color: .white.opacity(0), location: 1)
                ]), startPoint: .top, endPoint: .bottom)
            )

        
    }
}

struct TrayHeading: View{
    
    var body: some View{
        
        VStack(spacing: 2){
            
            Text("Sleep 7-9 hours")
                .font(.custom("Montserrat-Regular", size: 12))
                .opacity(0.5)
            
            Text("Badges")
                .font(.custom("Montserrat-Medium", size: 16))
                .opacity(0.75)
            
        }
        .foregroundColor(.black)
        .frame(maxWidth: .infinity, minHeight: 40.0)
        
        .padding(.top, 16)
           
    }
}

struct MainBadge: View{ //We should replace this with current badge struct
    
    @EnvironmentObject var badge: BadgeViewModel
   
    var body: some View{
        
        let currentBadge = badge.currentBadgesStatus.first(where: {$0.badgeAchieved == false})!
        
        BadgeImage(badgeItem: .constant(currentBadge), size: .constant(128))
            .padding(.top, 56)
            .padding(.bottom, 32)
        
    }
}

struct CurrentBadgeSubHeading: View{
    @EnvironmentObject var badge: BadgeViewModel
    
    var body: some View{
        
        let currentBadge = badge.currentBadgesStatus.first(where: {$0.badgeAchieved == false})!
        
        Text("\(currentBadge.shape)")
            .font(.custom("Montserrat-Medium", size: 20))
            .foregroundColor(.white)
            .padding(.bottom, 8)
        
        HStack(spacing: 0){
            
            Text((currentBadge.toAchieveRepetition - currentBadge.statusCount) == 1 ? "\(currentBadge.toAchieveRepetition - currentBadge.statusCount) repetition to go." : "\(currentBadge.toAchieveRepetition - currentBadge.statusCount) repetitions to go.")
                .font(.custom("Montserrat-Medium", size: 16))
            
            Group{
                
                Image("Heart")
                    .resizable()
                    .aspectRatio( contentMode: .fit)
                    .frame(width: 12, height: 12)
                    .padding(.horizontal, 2)
                
                Text(currentBadge.livesLeft == 1 ? "\(currentBadge.livesLeft) miss left" : "\(currentBadge.livesLeft) misses left")
                .font(.custom("Montserrat-Regular", size: 16))
    
            }
            .opacity(0.33)
            
            if badge.progressLostInBackground(lockedBadgeIndex: badge.minimizedBadge().index).redDot{
              //  RedDot()
            }
            
        }
        .foregroundColor(.white)
        .padding(.bottom, 48)
        
    }
}

struct BadgeTrayList: View{
    @EnvironmentObject var badge: BadgeViewModel
    @Binding var triangleClicked : Bool
    @Binding var goldClicked : Bool
   
    var body: some View{
        
        var redDot: Bool = badge.progressLostInBackground(lockedBadgeIndex: badge.currentBadgesStatus.first(where: {$0.badgeAchieved == false})?.index ?? 0).redDot
        
        VStack(spacing: 16){
            
            
            ForEach(badge.currentBadgesStatus){ badgeItem in
            
            
                Button(action:{
                    
                    if badgeItem.badgeAchieved{
                        
                        withAnimation(){
                            badge.badgeEarnedPopup.boolean = true
                            badge.badgeEarnedPopup.index = badgeItem.index
                        }
                         
                    } else if (badgeItem.index == badge.currentBadgesStatus.first(where: {$0.badgeAchieved == false})?.index && (redDot == true)){
                        
                        withAnimation(){
                            badge.badgeProgressLostPopup = true
                        }
                        
                    }
                }){
                    BadgeCell(badgeItem: .constant(badgeItem), redDot: .constant(redDot))
                }
                .buttonStyle(ButtonOpacity(opacity: .constant(0.25)))
            .padding(.horizontal, 24)
            
            
        }
        
    }
    }
}

struct BadgeCell: View{
    
    @EnvironmentObject var badge: BadgeViewModel
    @Binding var badgeItem: BadgeObject
    @Binding var redDot: Bool
    var body: some View{
        
        
        
        HStack(spacing: 0){
            
            BadgeImage(badgeItem: .constant(badgeItem), size: .constant(64))
                .shadow(color: Color(hue: badgeItem.midColor.hue, saturation: badgeItem.midColor.saturation, brightness: badgeItem.midColor.brightness).opacity(badgeItem.badgeAchieved ? 0.5 : 0), radius: 4)
                .padding(.vertical, 4)
                .padding(.horizontal, 16)
            
            
            
            VStack(alignment: .leading, spacing: 4){
                
                Text(badgeItem.shape)
                    .foregroundColor(.white)
                    .font(.custom("Montserrat-Medium", size: 16))
                
                Text(badgeItem.badgeAchieved ?
                     "\(badge.formattedDate(badgeAchievedDate: badgeItem.badgeAchievedDate))" :
                        "\(badgeItem.beginRepetition) - \(badgeItem.endRepetition) repetition")
                .lineLimit(1)
                .font(.custom("Montserrat-Regular", size: 14))
                .foregroundColor(.white)
                .opacity(0.5)
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            HStack(spacing: 4){
                
                Image("Heart")
                    .resizable()
                    .aspectRatio( contentMode: .fit)
                    .frame(width: 12, height: 12)
                    .opacity(0)
                
                    .background(
                        
                        LinearGradient(gradient: Gradient(stops: [
                            Gradient.Stop(color: Color(hue: badgeItem.endColor.hue,
                                                       saturation: badgeItem.endColor.saturation,
                                                       brightness: badgeItem.endColor.brightness), location: 0.0),
                            Gradient.Stop(color: Color(hue: badgeItem.midColor.hue,
                                                       saturation: badgeItem.midColor.saturation,
                                                       brightness: badgeItem.midColor.brightness), location: 0.5),
                            Gradient.Stop(color: Color(hue: badgeItem.endColor.hue,
                                                       saturation: badgeItem.endColor.saturation,
                                                       brightness: badgeItem.endColor.brightness), location: 1.0),
                        ]), startPoint: .leading, endPoint: .trailing)
                        .mask(
                            
                            Image("Heart")
                                .resizable()
                                .aspectRatio( contentMode: .fit)
                            
                        )
                        
                        
                    )
                
                Text("\(badgeItem.lives)")
                    .frame(width: 12, height: 12)
                    .foregroundColor(.white)
                
                
            }
            .padding(.trailing, 16)
            .frame(maxHeight: .infinity, alignment: .top)
            
            
            
        }
        .padding(.vertical, 16)
        .background(RoundedRectangle(cornerRadius: 24).foregroundColor(Color.white.opacity(0.1)))
        .opacity(badgeItem.badgeAchieved || (badge.currentBadgesStatus.first(where: {$0.badgeAchieved == false})?.index == badgeItem.index) ? 1 : 0.5)
        .overlay(badge.currentBadgesStatus.first(where: {$0.badgeAchieved == false})?.index == badgeItem.index ? (redDot ? CircleOverlay() : nil) : nil)
        
        
    }
}

struct CircleOverlay: View{
    
    var body: some View{
        
        Circle()
            .frame(width: 14, height: 14)
            .foregroundColor(.red)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding(.top, 1).padding(.trailing, 1)
            
        
    }
}


struct ButtonOpacity: ButtonStyle{
    
    @Binding var opacity: Double
    
    func makeBody(configuration: Self.Configuration) -> some View{
        configuration.label
           
            .opacity(configuration.isPressed ? opacity : 1)
            
    }
}
