

import SwiftUI

struct BadgeEarnedPopup: View {
    
    @EnvironmentObject var badge: BadgeViewModel
    @State var fullScale: Bool = false
    @State var showBadge: Bool = false
    @State var showText: Bool = false
    @State var showButton: Bool = false
    @State var opacity: Double = 0.2
    
    
    var body: some View {
        
        let achievedBadge = badge.currentBadgesStatus.last(where: {$0.badgeAchieved == true})!
        let substring = String(achievedBadge.endRepetition.dropLast(2))
        
        VStack{
            
            VStack(spacing: 4){
                
                ZStack{
                    
                    Text("Sleep 7-9 hours")
                        .font(.custom("Montserrat-Medium", size: 12))
                        .foregroundColor(.white)
                    
                    Button(action: {
                        
                        withAnimation(){
                            badge.badgeEarnedPopup = false
                        }
                        
                    }){
                        Image(systemName: "xmark")
                            .foregroundColor(Color(.white))
                            .font(.system(size: 16,weight: .light ,design: .rounded))
                            .padding(12)
                            .background(
                                Circle()
                                    .foregroundColor(Color.white.opacity(0.1))
                            )
                          
                            
                    }
                    .frame(maxWidth: .infinity,alignment: .trailing)
                    .padding(.trailing,16)
                
                }
                .padding(.bottom,15)
             
                Image("\(achievedBadge.shape)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .shadow(color: Color(hue: achievedBadge.midColor.hue, saturation: achievedBadge.midColor.saturation, brightness: achievedBadge.midColor.brightness).opacity(showBadge ? 0.75 : 0), radius: 4)
                    .shadow(color: Color.black.opacity(0.2), radius: 12, y: showBadge ? 16 : 0)
                    .frame(width: 150, height: 150, alignment: .center)
                   
                    .opacity(showBadge ? 1 : 0)
                    .offset(y: showBadge ? 0 : 48)
                
                VStack(spacing: 4){
                    //Text("\(substring) repetitions complete")
                    Text("\(achievedBadge.shape) badge achieved")
                        .font(.custom("Montserrat-Medium", size: 20))
                        .foregroundColor(.white)
                        .padding(.top,19)
                        .opacity(showText ? 1 : 0)
                        .offset(y: showText ? 0 : 32)
                    
                     Text("\(badge.formattedDate(badgeAchievedDate: achievedBadge.badgeAchievedDate))")
                        .font(.custom("Montserrat-Medium", size: 14))
                        .foregroundColor(.white).opacity(0.5)
                        .padding(.horizontal,32)
                        .padding(.bottom,35)
                        .opacity(showText ? 1 : 0)
                        .offset(y: showText ? 0 : 32)
                       
                }
               
                
                Button(action: {
                    
                }){
                    Text("Tell a friend")
                        .font(.custom("Montserrat-Medium", size: 16))
                        .foregroundColor(Color.black)
                        .padding()
                        .padding(.horizontal,16)
                        .background(Capsule()
                            .foregroundColor(.white))
                       
                }
                .opacity(showButton ? 1 : 0)
                .offset(y: showButton ? 0 : 16)
            
            }
        }
        .padding(.bottom,16)
        .padding(.vertical,16)
        .frame(maxWidth: .infinity)
        .background(
            
            ZStack{
                
                Color.black
                Image("\(achievedBadge.shape)Background")
                    .resizable()
                    .mask(
                        
                        LinearGradient(gradient: Gradient(stops: [
                            Gradient.Stop(color: .white.opacity(1), location: 0),
                            
                            Gradient.Stop(color: .white.opacity(0.2), location: 1)
                        ]), startPoint: .top, endPoint: .bottom)
                        .opacity(opacity)
                    )
            }
            .cornerRadius(34)
               
        )
        
        .padding(.horizontal,24)
    
        .onAppear{
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                
                withAnimation(.easeOut(duration: 2)){
                    
                    for index in 0...20{
                        
                        opacity += 0.04
                        
                    }
                    
                    showBadge = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                    withAnimation(.easeOut(duration: 1)){
                        showText = true
                    }
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
                    withAnimation(.easeOut(duration: 0.5)){
                        showButton = true
                    }
                }

            }
        }
    }
    
}

struct BadgeEarnedPopup_Previews: PreviewProvider {
    
    static var previews: some View {
        BadgeEarnedPopup()
           
    }
}
