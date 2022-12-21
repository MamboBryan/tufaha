//
//  AlertDialog.swift
//  tufaha
//
//  Created by MamboBryan on 21/12/2022.
//

import SwiftUI

struct AlertDialog: View {
    @EnvironmentObject var viewModel : ContentViewModel
    var alert: AppAlert
    
    var body: some View {
        GeometryReader { metric in
            ZStack{
                
                VStack {
                    
                    Image(systemName: getIcon())
                        .resizable()
                        .font(.largeTitle)
                        .foregroundColor(getColor())
                        .frame(width: 75, height: 75)
                        .padding(.top)
                    
                    Text(getTitle())
                        .font(.title3)
                        .bold()
                        .padding(.top)
                        .foregroundColor(getColor())
                    
                    Text(getMessage())
                        .font(.body)
                        .padding(.top, 0.2)
                        .padding(.bottom)
                        .frame(width: 250)
                        .multilineTextAlignment(.center)

                    switch(alert){
                    case .SUCCESS(let content):
                        Button("Ok") {
                            if content.cancel != nil {
                                content.cancel!()
                            }
                            dismissDialog()
                        }
                    case .ERROR(let content):
                        Button("Dismiss") {
                            if(content.cancel != nil){
                                content.cancel!()
                            }
                            dismissDialog()
                        }
                    case .CONFIRM(let content, let confirm):
                        HStack{
                            Button(content.posBtn){
                             confirm()
                             dismissDialog()
                            }
                            Button(content.negBtn){
                                if content.cancel != nil {
                                    content.cancel!()
                                }
                                dismissDialog()
                            }
                        }
                    case .DEFAULT:
                        Button("okay") {
                            dismissDialog()
                        }
                    }
                }
                .padding(.bottom, 20)
                .padding(.horizontal, 12)
                .background(.white)
                .cornerRadius(15)
                
            }
            .frame(width: metric.size.width, height: metric.size.height, alignment: .center)
            .background(.black.opacity(0.4))
        }
    }
    
    private func dismissDialog(){
        viewModel.hideAlert()
    }
    
    private func getIcon()-> String {
        switch(alert){
        case .SUCCESS:
            return "exclamationmark.circle.fill"
        case .ERROR:
            return "exclamationmark.circle.fill"
        case .CONFIRM:
            return "exclamationmark.circle.fill"
        case .DEFAULT:
            return "exclamationmark.circle.fill"
        }
    }
    
    private func getTitle()-> String {
        switch(alert){
        case .SUCCESS(let content):
            return content.title
        case .ERROR(let content):
            return content.title
        case .CONFIRM(let content, _):
            return content.title
        case .DEFAULT:
            return "Okay"
        }
    }
    
    private func getColor()-> Color {
        switch(alert){
        case .CONFIRM:
            return Color.orange
        case .ERROR(_):
            return Color.red
        case .SUCCESS(_):
            return Color.green
        case .DEFAULT:
            return Color.primary
        }
    }
    
    private func getMessage() -> String {
        switch(alert){
        case .SUCCESS(let content):
            return content.description
        case .ERROR(let content):
            return content.description
        case .CONFIRM(let content, _):
            return content.description
        case .DEFAULT:
            return ""
        }
    }
    
}

struct AlertDialog_Previews: PreviewProvider {
    static var previews: some View {
        AlertDialog(alert: AppAlert.DEFAULT)
    }
}
