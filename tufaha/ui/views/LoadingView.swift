//
//  LoadingView.swift
//  tufaha
//
//  Created by MamboBryan on 21/12/2022.
//

import SwiftUI

struct LoadingView: View {
    
    @State var title: String = ""
    @State private var animate = false
    
    let color = Color.secondary
    let color1 = Color.secondary.opacity(0.75)
    let style = StrokeStyle(lineWidth:5, lineCap: .round)
    
    var body: some View {
        VStack {
            Circle()
                 .trim(from: 0, to: 0.75)
                 .stroke(
                     AngularGradient(gradient: .init(colors: [color,color1]), center: .center), style: style
                 )
                 .rotationEffect(Angle(degrees: animate ? 360 : 0))
                 .animation(Animation.linear(duration: 0.7).repeatForever(autoreverses: false))
                 .frame(width: 36, height: 36, alignment: .center)
                 .padding(48)
            
            if(title.isEmpty){
                Text(title).padding(.vertical)
            }

        }
        .background(Color.white)
        .cornerRadius(10)
        .onAppear{
            animate.toggle()
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
