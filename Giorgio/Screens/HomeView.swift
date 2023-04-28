//
//  HomeView.swift
//  Giorgio
//
//  Created by Yasin Cetin on 28.04.2023.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onboarding") var isOnboardingViewActive = false
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
                    
                    Spacer()
                    
                    //MARK: - FOOTER
                    ZStack {
                        Button(action: {
                            isOnboardingViewActive = true
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
                    Spacer()
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
