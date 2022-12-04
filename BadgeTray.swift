//
//  BadgeTray.swift
//  Badges
//
//  Created by Rishabh Maini on 04/12/22.
//

import SwiftUI

struct BadgeTray: View {
    
    @State var triangleClicked = false
    @State var goldClicked = false
    @State var rubyClicked = false
    @EnvironmentObject var badge: BadgeViewModel
    
    var body: some View {
        
        ZStack{
            
            Color(hue: 0, saturation: 0, brightness: 0.07) // Replace this with Color(hex: "121212)
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false){
            ZStack(alignment: .top){
                
                BadgeBackground()
                
                VStack{
                    
                    TrayHeading()
                    BadgeImage()
                    CurrentBadgeSubHeading()
                    BadgeTrayList()
                }
            }
        }
        }
        .overlay(triangleClicked ? BadgeIntroPopup(triangleClicked: $triangleClicked) : nil)
        .overlay(goldClicked ? BadgeEarnedPopup(goldClicked: $goldClicked) : nil)
        .overlay(rubyClicked ? ProgressLostPopup(rubyClicked: $rubyClicked) : nil)
            
    }
}

struct BadgeBackground: View{
    
    @EnvironmentObject var badge: BadgeViewModel
    
    var body: some View{
        
        
        let currentBadge = badge.currentBadgeStatus(defaultBadges: badges).first(where: {$0.badgeAchieved == false})!
        
        Image("\(currentBadge.shape)Background")
                    .edgesIgnoringSafeArea(.all)
        
    }
}

struct TrayHeading: View{
    
    var body: some View{
        
        Group{
            Text("Sleep 7-9 hours")
                .opacity(0.4)
                .padding(.top,16)
             
            Text("Badges")
                .padding(.bottom,60)
        }.foregroundColor(.black)
           
    }
}

struct BadgeImage: View{ //We should replace this with current badge struct
    @EnvironmentObject var badge: BadgeViewModel
    
    var body: some View{
        
        let currentBadge = badge.currentBadgeStatus(defaultBadges: badges).first(where: {$0.badgeAchieved == false})!
        
        Image("\(currentBadge.shape)")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .opacity(0.25)
            .frame(width:130,height: 130)
            .overlay(
                
                Image("\(currentBadge.shape)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .mask(
                        Color.white.opacity(1)
                            .frame(height: CGFloat((Double(currentBadge.statusCount)/Double(currentBadge.toAchieveRepetition)))*130.0)
                            .frame(maxHeight: .infinity, alignment: .bottom)
                    )
            )    }
}

struct CurrentBadgeSubHeading: View{
    @EnvironmentObject var badge: BadgeViewModel
    
    var body: some View{
        let currentBadge = badge.currentBadgeStatus(defaultBadges: badges).first(where: {$0.badgeAchieved == false})!
        
        Text("\(currentBadge.shape)")
            .bold()
            .font(.headline)
            .foregroundColor(.white)
            .padding(.bottom,1)
        HStack{
            Text((currentBadge.toAchieveRepetition - currentBadge.statusCount) == 1 ? "\(currentBadge.toAchieveRepetition - currentBadge.statusCount) repetition to go." : "\(currentBadge.toAchieveRepetition - currentBadge.statusCount) repetition to go.")
                .foregroundColor(.white)
            Image(systemName: "heart.fill")
                .foregroundColor(Color(.systemPink))
                .opacity(0.4)
            Text(currentBadge.livesLeft == 1 ? "\(currentBadge.livesLeft) miss left" : "\(currentBadge.livesLeft) misses left")
                .foregroundColor(.white)
                .opacity(0.4)
        }
        .padding(.bottom,47)
        
    }
}

struct BadgeTrayList: View{
    @EnvironmentObject var badge: BadgeViewModel
    
    var body: some View{
        
        VStack(spacing: 16){
            
        ForEach(0..<badge.currentBadgeStatus(defaultBadges: badges).count){ i in
            
            
            HStack(spacing: 0){
                Button(action: {
                    //triangleClicked.toggle()
                }){
                    Image("\(badge.currentBadgeStatus(defaultBadges: badges).map({$0.shape})[i])")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .opacity(0.25)
                        .frame(width: 64, height: 64, alignment: .leading)
                    
                        .overlay(
                            
                            Image("\(badge.currentBadgeStatus(defaultBadges: badges).map({$0.shape})[i])")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .mask(
                                    Color.white.opacity(1)
                                        .frame(height: CGFloat((Double(badge.currentBadgeStatus(defaultBadges: badges).map({$0.statusCount})[i])/Double(badge.currentBadgeStatus(defaultBadges: badges).map({$0.toAchieveRepetition})[i])))*70.0)
                                        .frame(maxHeight: .infinity, alignment: .bottom)
                                    
                                )
                        )
                        .padding(.vertical, 4)
                        .padding(.horizontal, 16)
                }
                
                VStack(alignment: .leading){
                    Text("\(badge.currentBadgeStatus(defaultBadges: badges).map({$0.shape})[i])")
                        .foregroundColor(.white)
                    Text((badge.currentBadgeStatus(defaultBadges: badges).map({$0.badgeAchieved})[i]) == true ?
                         " \(badge.currentBadgeStatus(defaultBadges: badges).map({$0.badgeAchievedDate.formatted()})[i])" :
                            "\(badge.currentBadgeStatus(defaultBadges: badges).map({$0.beginRepetition})[i]) - \(badge.currentBadgeStatus(defaultBadges: badges).map({$0.endRepetition})[i]) repetition")
                    .foregroundColor(.white)
                    .opacity(0.4)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack(spacing: 4){
                    
                    Image(systemName: "heart.fill")
                        .resizable()
                        .foregroundColor(Color(.systemPink))
                        .frame(width: 12, height: 12)
                    
                    Text("\(badge.currentBadgeStatus(defaultBadges: badges).map({$0.lives})[i])")
                        .frame(width: 12, height: 12)
                        .foregroundColor(.white)
                    
                    
                }
                .padding(.trailing, 16)
                
                .frame(maxHeight: .infinity, alignment: .top)
                
                
            }
            .padding(.vertical, 16)
            .background(RoundedRectangle(cornerRadius: 24).foregroundColor(Color.white.opacity(0.1)))
            .padding(.horizontal, 24)
            
        }
        
    }
    }
}
struct BadgeTray_Previews: PreviewProvider {
    static var previews: some View {
        BadgeTray()
    }
}
