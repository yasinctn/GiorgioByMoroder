//
//  HomeView.swift
//  Giorgio
//
//  Created by Yasin Cetin on 28.04.2023.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onboarding") var isOnboardingViewActive = false
    @State private var isAnimating = false
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            VStack {
                
                //MARK: - HEAD
                Spacer()
                VStack {
                    ZStack {
                        CircleGroups(circleColor: .accentColor, circleOpacity: 0.2)
                        
                        Image("DP2")
                            .resizable()
                            .scaledToFit()
                            .padding()
                            .offset(y: isAnimating ? 5 : -5)
                            .animation(.easeInOut(duration: 0.5).repeatForever(), value: isAnimating)

                    }
                    Spacer()
                    
                    //MARK: - CENTER
                    
                    Text ("\"But everybody cals me\"")
                        .font(.largeTitle.italic())
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                    Text ("\"Giorgio\"")
                        .font(.largeTitle.italic())
                        .foregroundColor(.yellow)
                        .multilineTextAlignment(.center)
                        .opacity(isAnimating ? 1 : 0.5 )
                        .scaleEffect(isAnimating ? 1 : 0.5 )
                        .animation(.easeOut(duration: 0.5), value: isAnimating)
                    
                    Spacer()
                    
                    //MARK: - FOOTER
                    ZStack {
                        Button(action: {
                            withAnimation {
                                isOnboardingViewActive = true
                            }
                        }) {
                            Image(systemName: "arrow.triangle.2.circlepath")
                                .bold()
                                .foregroundColor(.black)
                                .font(.title)
                                
                            Text("Restart")
                                .font(.system(.largeTitle, design: .rounded, weight: .bold)).foregroundColor(.black)
                        }.buttonStyle(.borderedProminent)
                            .buttonBorderShape(.capsule)
                    }
                    .opacity(isAnimating ? 1 : 0 )
                    .animation(.easeOut(duration: 1).delay(5), value: isAnimating)
                    
                    Spacer()
                }
            }
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() , execute: {
                isAnimating = true
            })
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
