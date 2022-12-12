//
//  LottieView.swift
//  JournalProcess2
//
//  Created by Rishabh Maini on 28/08/22.
//

import SwiftUI
import Lottie
 
struct LottieView: UIViewRepresentable {

    let isPlay: Bool
    let lottieFile: String
 
    let animationView = LottieAnimationView()
 
   // func makeUIView(context: Context) -> some UIView {
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView(frame: .zero)
        
        animationView.animation = Animation.named(lottieFile)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .playOnce
        animationView.animationSpeed = 1
      
        
 
        view.addSubview(animationView)
 
        animationView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
        animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        return view
    }

    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
           if isPlay {
               context.coordinator.parent.animationView.play()
           } else {
               context.coordinator.parent.animationView.stop()

           }
       }

       func makeCoordinator() -> Coordinator {
           Coordinator(self)
       }

       class Coordinator: NSObject {
           var parent: LottieView

           init(_ parent: LottieView) {
               self.parent = parent
           }
       }
    
    
}


