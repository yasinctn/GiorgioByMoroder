//
//  ContentView.swift
//  Giorgio
//
//  Created by Yasin Cetin on 28.04.2023.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("onboarding") var isOnboardingViewActive = true
    
    
    var body: some View {
        if isOnboardingViewActive{
            OnboardingView()
        }else{
            HomeView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
