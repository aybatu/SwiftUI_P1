//
//  OnboardingView.swift
//  SwiftUI_P1
//
//  Created by Aybatu Kerküklüoğlu on 13/12/2021.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffset: CGFloat = 0
    var body: some View {
        ZStack {
            Color("ColorBlue")
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 20) {
                Spacer()
                VStack {
                    Text("Share.")
                        .foregroundColor(.white)
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                    Text("""
                    It's not how much we give but
                    how much love we put into giving.
                    """)
                        .fontWeight(.light)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .font(.title3)
                        .padding(.horizontal, 10)
                } //Header
                Spacer()
                // MARK: - CENTER
                ZStack {
                    CircleGroupView(shapeColor: .white, shapeOpacity: 0.2)
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                } //Center
                Spacer()
                
                ZStack {
                    Text("Get Started")
                        .font(.system(.title3, design: .rounded))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .offset(x: 20)
                    
                    Capsule()
                        .fill(.white.opacity(0.2))
                    Capsule()
                        .fill(.white.opacity(0.2))
                        .padding(8)
                    HStack {
                        Capsule()
                            .fill(Color("ColorRed"))
                            .frame(width: 80)
                        Spacer()
                    }
                    HStack {
                        ZStack {
                            Circle()
                                .fill(Color("ColorRed"))
                                
                            Circle()
                                .fill(Color.black.opacity(0.15))
                                .padding(8)
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24, weight: .bold))
                        }
                        .foregroundColor(.white)
                        .frame(width: 80, height: 80, alignment: .center)
                        .offset(x: buttonOffset)
                        .gesture(
                            DragGesture()
                                .onChanged({ gesture in
                                    if gesture.translation.width > 0 && buttonOffset <= buttonWidth - 80 {
                                        buttonOffset = gesture.translation.width
                                    }
                                })
                                .onEnded({ _ in
                                    if buttonOffset > buttonWidth / 2 {
                                        buttonOffset = buttonWidth - 80
                                        isOnboardingViewActive = false
                                    } else {
                                        buttonOffset = 0
                                    }
                                })
                        )
                        Spacer()
                    }
                } //Footer
                .frame(height: 80, alignment: .center)
                .padding(40)
        
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
