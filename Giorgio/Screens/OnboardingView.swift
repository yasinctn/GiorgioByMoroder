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
    @State private var isAnimating = false
    var body: some View {
        
        ZStack{
            Color(.black)
                .ignoresSafeArea()
            VStack(spacing: 20) {
                // MARK: - HEAD
                Spacer()
                
                VStack {
                    Text("Daft Punk")
                        .font(.system(size: 50))
                        .fontWeight(.bold)
                        .foregroundColor(.accentColor)
                    
                    Text("\"My Name is Giovanni Giorgio\"")
                        .foregroundColor(.gray)
                        .font(.title.italic())
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : -40)
                .animation(.easeIn(duration: 0.5), value: isAnimating)
                
                
                
                // MARK: - CENTER
                ZStack{
                    
                    CircleGroups(circleColor: .yellow, circleOpacity: 0.2)
                    
                    Image("DP1")
                        .resizable()
                        .scaledToFit()
                        .opacity(isAnimating ? 1 : 0)
                        .animation(.easeInOut(duration: 1), value: isAnimating)
                }
                
                Spacer()
                
                // MARK: - FOOTER
                
                
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
                        .offset(x:buttonOffset + 35)
                        .gesture(
                            DragGesture()
                                .onChanged{ gesture in
                                    
                                    if gesture.translation.width > 0 && buttonOffset <= buttonWidth - 50{
                                        buttonOffset = gesture.translation.width
                                    }
                                }
                                .onEnded{ _ in
                                    withAnimation(.easeOut(duration: 0.3)) {
                                        if buttonOffset > buttonWidth / 2 {
                                            buttonOffset = buttonWidth - 80
                                            isOnboardingViewActive = false
                                        }else{
                                            buttonOffset = 0
                                        }
                                    }
                                }
                        )
                        Spacer()
                    }
                    .padding()
                }
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : 40)
                .animation(.easeIn(duration: 0.5), value: isAnimating)
            }
        }.onAppear {
            isAnimating = true
        }
    }
}


struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
