//
//  LoadingDialog.swift
//  tufaha
//
//  Created by MamboBryan on 21/12/2022.
//

import SwiftUI

struct LoadingDialog: View {
    var data: LoadingData
    @State var animate = false
    
    let color = Color.secondary
    let color1 = Color.secondary.opacity(0.75)
    let style = StrokeStyle(lineWidth:5, lineCap: .round)
    
    var body: some View {
        GeometryReader { metric in
            ZStack{
                
                LoadingView(title: data.msg)
               
            }
            .onAppear(){
                animate.toggle()
            }
            .frame(width: metric.size.width, height: metric.size.height, alignment: .center)
            .background(.black.opacity(0.4))
        }
    }
}

struct LoadingDialog_Previews: PreviewProvider {
    static var previews: some View {
        LoadingDialog(data: LoadingData())
    }
}
