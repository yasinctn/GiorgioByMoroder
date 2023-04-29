//
//  CircleGroups.swift
//  Giorgio
//
//  Created by Yasin Cetin on 28.04.2023.
//

import SwiftUI

struct CircleGroups: View {
    
    @State var circleColor : Color
    @State var circleOpacity : Double
    @State private var isAnimating = false

    var body: some View {
        ZStack{
            Circle()
                .stroke(circleColor.opacity(circleOpacity),lineWidth: 70)
                .frame(width: 270, height: 270, alignment: .center)
            
            Circle()
                .stroke(circleColor.opacity(circleOpacity),lineWidth: 25)
                .frame(width: 270, height: 270, alignment: .center)
            
        }
        .blur(radius:isAnimating ? 0 : 10 )
        .opacity(isAnimating ? 1 : 0.5 )
        .scaleEffect(isAnimating ? 1 : 0.5 )
        .animation(.easeOut(duration: 1), value: isAnimating)
        .onAppear {
            isAnimating = true
        }
    }
}

struct CircleGroups_Previews: PreviewProvider {
    static var previews: some View {
        CircleGroups(circleColor: .black, circleOpacity: 0.2)
    }
}
