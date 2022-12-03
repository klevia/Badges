//
//  ContentView.swift
//  Badges
//
//  Created by Klevia Ulqinaku on 01.12.22.
//

import SwiftUI

struct ContentView: View {
    
    @State var triangleClicked = false
    @State var goldClicked = false
    @State var rubyClicked = false
    
    var body: some View {
        
        //BadgeReturnTemp()
         
        ZStack(alignment: .top){
            Color.black
                .ignoresSafeArea()
            
        VStack(){
            Text("Sleep 7-9 hours")
                .foregroundColor(.white)
                .opacity(0.4)
                .padding(.bottom,1)
            Text("Badges")
                .foregroundColor(.white)
                .padding(.bottom,62)
            
            Polygon(sides : 3)
                .rotation(Angle(degrees: 30))
                .fill(
                    LinearGradient(
                        gradient: Gradient(stops: [
                            Gradient.Stop(color: .gray, location: 0.2),
                            Gradient.Stop(color: .white, location: 0.2)
                        ]),
                        startPoint: .top,
                        endPoint: .bottom))
                .frame(width: 150)
                .padding(.bottom,24)
            
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
            
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 342,height: 100)
                    .foregroundColor(Color(.darkGray))
                HStack(){
                    Button(action: {
                        triangleClicked.toggle()
                    }){
                        Polygon(sides : 3)
                            .rotation(Angle(degrees: 30))
                            .fill(Color(.yellow))
                            .frame(width: 70,height: 70,alignment: .leading)
                            .padding(.top)
                    }
                    VStack{
                        Text("Silver")
                            .foregroundColor(.white)
                        Text("0-3rd repetition")
                            .foregroundColor(.white)
                            .opacity(0.4)
                    }
                    .padding(.leading,10)
                    HStack{
                        Image(systemName: "heart.fill")
                            .foregroundColor(Color(.systemPink))
                        Text("4")
                            .foregroundColor(.white)
                        
                            
                    }
                    .padding(.leading,50)
                    .padding(.bottom,40)
                    
                }
                .frame(width: 342,height: 100)
            }
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 342,height: 100)
                    .foregroundColor(Color(.darkGray))
                HStack(){
                    Button(action: {
                        goldClicked.toggle()
                    }){
                        Polygon(sides : 4)
                            .fill(Color(.orange))
                            .frame(width: 70,height: 70,alignment: .leading)
                            .padding(.top)
                            .padding(.bottom)
                    }
                    VStack{
                        Text("Gold")
                            .foregroundColor(.white)
                        Text("4th - 10th repetition")
                            .foregroundColor(.white)
                            .opacity(0.4)
                    }.padding(.leading,10)
                    HStack{
                        Image(systemName: "heart.fill")
                            .foregroundColor(Color(.systemPink))
                        Text("4")
                            .foregroundColor(.white)
                        
                            
                    }
                    .padding(.leading,30)
                    .padding(.bottom,40)
                    
                }
                .frame(width: 342,height: 100)
            }
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 342,height: 100)
                    .foregroundColor(Color(.darkGray))
                HStack(){
                    Button(action: {
                       rubyClicked.toggle()
                    }){
                        Polygon(sides : 5)
                            .rotation(Angle(degrees: 55))
                            .fill(Color(.green))
                            .frame(width: 70,height: 70,alignment: .leading)
                            .padding(.top)
                    }
                    VStack{
                        Text("Ruby")
                            .foregroundColor(.white)
                        Text("11th - 21st repetition")
                            .foregroundColor(.white)
                            .opacity(0.4)
                    }.padding(.leading,10)
                    HStack{
                        Image(systemName: "heart.fill")
                            .foregroundColor(Color(.systemPink))
                        Text("4")
                            .foregroundColor(.white)
                        
                            
                    }
                    .padding(.leading,30)
                    .padding(.bottom,40)
                    
                }
            }
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 342,height: 100)
                    .foregroundColor(Color(.darkGray))
                HStack(){
                    
                    Polygon(sides : 6)
                        .rotation(Angle(degrees: 30))
                        .fill(Color(.systemBlue))
                        .frame(width: 70,height: 70,alignment: .leading)
                        .padding(.top)
                    VStack{
                        Text("Diamond")
                            .foregroundColor(.white)
                        Text("22 - 45th repetition")
                            .foregroundColor(.white)
                            .opacity(0.4)
                    }.padding(.leading,10)
                    HStack{
                        Image(systemName: "heart.fill")
                            .foregroundColor(Color(.systemPink))
                        Text("4")
                            .foregroundColor(.white)
                        
                            
                    }
                    .padding(.leading,30)
                    .padding(.bottom,40)
                    
                }
            }
        }
        .frame(alignment: .top)
        }.overlay(triangleClicked ? Overlay(triangleClicked: $triangleClicked) : nil)
            .overlay(goldClicked ? Overlay2(goldClicked: $goldClicked) : nil)
            .overlay(rubyClicked ? Overlay3(rubyClicked: $rubyClicked) : nil)
         
        
    }
}

struct Overlay : View{
    @Binding var triangleClicked : Bool
    
    var body: some View {
        VStack{
            VStack(spacing: 5){
                
                HStack(spacing: 10){
                    Polygon(sides : 3)
                        .rotation(Angle(degrees: 30))
                        .fill(Color(.yellow))
                        .padding(.top,20)
                        .frame(width: 75,height: 75,alignment: .center)
                   
                       
                    
                    Polygon(sides : 4)
                        .fill(Color(.orange))
                        .frame(width: 70,height: 70,alignment: .center)
                    
                    Polygon(sides : 5)
                        .rotation(Angle(degrees: 55))
                        .fill(Color(.green))
                        .frame(width: 70,height: 70,alignment: .center)
                }
                .frame(maxWidth: .infinity,alignment: .center)
                .padding(.horizontal,32)
                HStack(spacing: 10){
                    Polygon(sides : 6)
                        .rotation(Angle(degrees: 30))
                        .fill(Color(.systemBlue))
                        .frame(width: 70,height: 70,alignment: .leading)
                    
                    Polygon(sides : 7)
                        .rotation(Angle(degrees: 14))
                        .fill(Color(.systemPurple))
                        .frame(width: 70,height: 70,alignment: .leading)
                    
                   
                }
                .frame(maxWidth: .infinity,alignment: .center)
 
                .padding(.horizontal,32)
                .padding(.bottom,20)
                
                Text("90 days. 5 badges")
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                    .padding(.top,24)
                Text("Turn any activity that you wish to start doing, into a lifestyle that you can't stop. Along the we'll reward you with some sparkling badges.")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 14))
                    .foregroundColor(.white).opacity(0.5)
                    .padding(.horizontal,32)
                   
                
                Button(action: {
                    triangleClicked.toggle()
                }){
                    Text("Close")
                        .foregroundColor(Color.black)
                        .background(Capsule()
                            .foregroundColor(.white)
                            .frame(width: 133,height: 50))
                        .padding(.top,40)
                       
                }
            }
        }
       
        .padding(.vertical,32)
   
        .frame(maxWidth: .infinity)
       
    
        .background(Color(hue: 0, saturation: 0, brightness: 0.15))
        .padding(.horizontal,16)
    }
    
}

struct Overlay2 : View{
    @Binding var goldClicked : Bool
    
    var body: some View {
        VStack{
            VStack(spacing: 5){
                HStack(spacing: 75){
                    Text("Sleep 7-9 hours")
                        .font(.system(size: 12))
                        .foregroundColor(.white)
                    
                    Button(action: {
                        goldClicked.toggle()
                    }){
                        Image(systemName: "x.circle.fill")
                            .renderingMode(.original)
                            .foregroundColor(Color(.gray)).opacity(0.3)
                            .font(.system(size: 40))
                    }
                }
                .frame(maxWidth: .infinity,alignment: .trailing)
                .padding(.trailing,16)
                
                Polygon(sides : 6)
                    .rotation(Angle(degrees: 30))
                    .fill(Color(.systemBlue))
                    .shadow(color: .blue, radius: 30)
                    .frame(width: 150,height: 150,alignment: .leading)
                
            
                
                Text("21 repetitions complete")
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                Text("Earned on 25th Jan 2022")
                    .font(.system(size: 14))
                    .foregroundColor(.white).opacity(0.5)
                    .padding(.horizontal,32)
                    .padding(.bottom,30)
                
                Button(action: {
                    goldClicked.toggle()
                }){
                    Text("Tell a friend")
                        .foregroundColor(Color.black)
                        .background(Capsule()
                            .foregroundColor(.white)
                            .frame(width: 180,height: 50))
                }
            }
        }
       
        .padding(.vertical,32)
   
        .frame(maxWidth: .infinity)
       
    
        .background(Color(hue: 0.5611, saturation: 1, brightness: 0.15))
        .padding(.horizontal,16)
    }
    
}
struct Overlay3 : View{
    @Binding var rubyClicked : Bool
    
    var body: some View {
        VStack{
            VStack(spacing: 5){
                HStack(spacing: 75){
                    Text("Sleep 7-9 hours")
                        .font(.system(size: 12))
                        .foregroundColor(.white)
                    
                    Button(action: {
                        rubyClicked.toggle()
                    }){
                        Image(systemName: "xmark.circle.fill")
                          //  .renderingMode(.original)
                          //  .foregroundColor(Color(.gray)).opacity(0.3)
                            .font(.system(size: 40))
                    }
                }
                .frame(maxWidth: .infinity,alignment: .trailing)
                .padding(.trailing,16)
                
                ZStack{
                    Polygon(sides : 6)
                        .rotation(Angle(degrees: 30))
                    //   .stroke(Color.blue, lineWidth: 3)
                        .shadow(color: .blue, radius: 30)
                        .frame(width: 150,height: 150,alignment: .leading)
                    
                    Image(systemName: "bolt.heart.fill")
                        .renderingMode(.original)
                        .foregroundColor(Color(hue: 0.56111, saturation: 1, brightness: 1))
                        .font(.system(size: 54))
                }
                
            
                
                Text("You ran out of misses")
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                    .padding(.top,24)
                Text("On route 21st - 45th repetition, you missed the habit more than 4 times. Let's start again and stronger this time")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 14))
                    .foregroundColor(.white).opacity(0.5)
                    .padding(.horizontal,32)
                    .padding(.bottom,30)
                
                Button(action: {
                    rubyClicked.toggle()
                }){
                    Text("Close")
                        .foregroundColor(Color.black)
                        .background(Capsule()
                            .foregroundColor(.white)
                            .frame(width: 133,height: 50))
                        .padding(.top,37)
                }
            }
        }
       
        .padding(.vertical,32)
   
        .frame(maxWidth: .infinity)
        .background(RoundedRectangle(cornerRadius: 24)
            .fill(Color(hue: 0.5611, saturation: 1, brightness: 0.15)))
        .padding(.horizontal,16)
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
