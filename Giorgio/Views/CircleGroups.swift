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

    var body: some View {
        ZStack{
            Circle()
                .stroke(circleColor.opacity(circleOpacity),lineWidth: 80)
                .frame(width: 270, height: 270, alignment: .center)
            
            Circle()
                .stroke(circleColor.opacity(circleOpacity),lineWidth: 35)
                .frame(width: 270, height: 270, alignment: .center)
            
        }
    }
}

struct CircleGroups_Previews: PreviewProvider {
    static var previews: some View {
        CircleGroups(circleColor: .black, circleOpacity: 0.2)
    }
}
