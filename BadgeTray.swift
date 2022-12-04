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
    
    var body: some View {
        
        ZStack{
            
            Color(hue: 0, saturation: 0, brightness: 0.07)
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
    
    var body: some View{
        
        
        
        Image("TriangleBackground")
                    .edgesIgnoringSafeArea(.all)
        
    }
}

struct TrayHeading: View{
    
    var body: some View{
        
        Group{
            Text("Sleep 7-9 hours")
                .opacity(0.4)
                .padding(.bottom,1)
            Text("Badges")
                .padding(.bottom,62)
        }.foregroundColor(.black)
    }
}

struct BadgeImage: View{ //We should replace this with current badge struct
    
    var body: some View{
        
        Image("Triangle")
    }
}

struct CurrentBadgeSubHeading: View{
    
    var body: some View{
        
        Text("Silver")
            .bold()
            .font(.headline)
            .foregroundColor(.white)
            .padding(.bottom,1)
        HStack{
            Text("4 repetitions to go.")
                .foregroundColor(.white)
            Image(systemName: "heart.fill")
                .foregroundColor(Color(.systemPink))
                .opacity(0.4)
            Text("2 misses left")
                .foregroundColor(.white)
                .opacity(0.4)
        }
        .padding(.bottom,47)
        
    }
}

struct BadgeTrayList: View{
    
    var body: some View{
        
        ForEach(0..<badges.count){ i in
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 342,height: 100)
                    .foregroundColor(Color(.darkGray))
                HStack(){
                    Button(action: {
                        //triangleClicked.toggle()
                    }){
                        Image("\(badges[i].shape)")
                            .resizable()
                            .frame(width: 70,height: 70,alignment: .leading)
                            
                    }
                    VStack{
                        Text("\(badges[i].shape)")
                            .foregroundColor(.white)
                        Text("\(badges[i].beginRepetition) - \(badges[i].endRepetition) repetition")
                            .foregroundColor(.white)
                            .opacity(0.4)
                    }
                    .padding(.leading,10)
                    HStack{
                        Image(systemName: "heart.fill")
                            .foregroundColor(Color(.systemPink))
                        Text("\(badges[i].lives)")
                            .foregroundColor(.white)
                        
                            
                    }
                    .padding(.leading,50)
                    .padding(.bottom,40)
                    
                }
                .frame(width: 342,height: 100)
            }
            
        }
    }
}
struct BadgeTray_Previews: PreviewProvider {
    static var previews: some View {
        BadgeTray()
    }
}
