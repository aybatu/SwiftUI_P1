//
//  CircleGroupView.swift
//  SwiftUI_P1
//
//  Created by Aybatu Kerküklüoğlu on 13/12/2021.
//

import SwiftUI

struct CircleGroupView: View {
    @State var shapeColor: Color
    @State var shapeOpacity: Double
    @State private var isAnimating: Bool = true
    var body: some View {
        ZStack {
            Circle()
                .stroke(shapeColor.opacity(shapeOpacity), lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
            Circle()
                .stroke(shapeColor.opacity(shapeOpacity), lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)
        }.opacity(isAnimating ? 0 : 1)
            .blur(radius: isAnimating ? 10 : 0)
            .scaleEffect(isAnimating ? 0.5 : 1)
            .animation(.easeOut(duration: 1), value: isAnimating)
            .onAppear {
                isAnimating = false
            }
    }
}

struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("ColorBlue")
                .edgesIgnoringSafeArea(.all)
            CircleGroupView(shapeColor: .white, shapeOpacity: 0.2)
        }
    }
}
