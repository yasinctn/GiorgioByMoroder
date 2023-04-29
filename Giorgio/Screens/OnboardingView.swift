//
//  OnboardingView.swift
//  Giorgio
//
//  Created by Yasin Cetin on 28.04.2023.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("onboarding") var isOnboardingViewActive = true
    @State private var buttonWidth = UIScreen.main.bounds.width - 130
    @State private var buttonOffset = 0.0
    var body: some View {
        
        ZStack{
            Color(.black)
                .ignoresSafeArea()
            VStack(spacing: 20) {
                // MARK: - HEAD
                Spacer()
                Text("Daft Punk")
                    .font(.system(size: 50))
                    .fontWeight(.bold)
                    .foregroundColor(.accentColor)
                
                Text("\"My Name is Giovanni Giorgio\"")
                    .foregroundColor(.gray)
                    .font(.title.italic())
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                Spacer()
                
                // MARK: - CENTER
                ZStack{
                    
                    CircleGroups(circleColor: .yellow, circleOpacity: 0.2)
                    
                    Image("DP1")
                        .resizable()
                        .scaledToFit()
                    
                }
                Spacer()
                
                // MARK: - FOOTER
                
                
                ZStack {
                    ZStack {
                        ZStack{
                            Capsule()
                                .fill(.white.opacity(0.2))
                                .frame(width: 290, height: 80, alignment: .center)
                            Capsule()
                                .fill(.white.opacity(0.2))
                                .frame(width: 280, height: 70, alignment: .center)
                            Text("Slide It")
                                .foregroundColor(.white)
                                .bold()
                        }
                       
                        HStack {
                            ZStack {
                                Circle()
                                    .fill(.red.opacity(0.5))
                                    .frame(width: 80, height: 80, alignment: .center)
                                
                                Circle()
                                    .fill(.red.opacity(1))
                                    .frame(width: 70, height: 70, alignment: .center)
                                
                                Image(systemName: "chevron.right.2")
                                    .font(.largeTitle)
                                    .bold()
                                    .foregroundColor(.white)
                            }
                            .offset(x:buttonOffset + 27)
                            .gesture(
                                DragGesture()
                                    .onChanged({ gesture in
                                        
                                        if gesture.translation.width > 0 && buttonOffset <= buttonWidth - 50{
                                            buttonOffset = gesture.translation.width
                                        }
                                    })
                                    .onEnded({ _ in
                                        if buttonOffset > buttonWidth / 2 {
                                            buttonOffset = buttonWidth - 30
                                            isOnboardingViewActive = false
                                        }else{
                                            buttonOffset = 0
                                        }
                                        
                                    })
                            )
                            Spacer()
                        }
                        .padding()
                    }
                }
            }
        }
        
        
        
    }
}


struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
