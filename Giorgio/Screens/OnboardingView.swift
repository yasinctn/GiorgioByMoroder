//
//  OnboardingView.swift
//  Giorgio
//
//  Created by Yasin Cetin on 28.04.2023.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("onboarding") var isOnboardingViewActive = true
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
                    .foregroundColor(.white)
                    .font(.title3.italic())
                    .multilineTextAlignment(.center)
                
                    .padding(5)
                
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
                    Capsule()
                        .fill(.white.opacity(0.2))
                    .frame(width: 340, height: 80, alignment: .center)
                    Capsule()
                        .fill(.white.opacity(0.2))
                        .frame(width: 330, height: 70, alignment: .center)
                    
                    HStack {
                        ZStack {
                            Circle()
                                .fill(.red.opacity(0.5))
                            .frame(width: 80, height: 80, alignment: .center)
                            
                            Circle()
                                .fill(.red.opacity(1))
                                .frame(width: 70, height: 70, alignment: .center).padding()
                                
                            
                            Image(systemName: "chevron.right.2")
                                .font(.largeTitle)
                                .bold()
                                .foregroundColor(.white)
                        }
                        .onTapGesture {
                            isOnboardingViewActive = false
                        }
                        Spacer()
                    }
                }
                .padding()
            }
            
            
            
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
