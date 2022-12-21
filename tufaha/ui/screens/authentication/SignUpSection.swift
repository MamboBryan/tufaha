//
//  SignUpSection.swift
//  tufaha
//
//  Created by MamboBryan on 21/12/2022.
//

import SwiftUI

struct SignUpSection: View {
    
    @EnvironmentObject private var mainViewModel : ContentViewModel
    var viewModel: AuthenticationViewModel
    
    var body: some View {
        VStack{
            Spacer()
            Text("SignUp")
            Button("Continue") {
                signUp()
            }.padding(.vertical, 12)
            Button("Back") {
                viewModel.updateAuthenticationState(state: .SIGN_IN)
            }.padding(.vertical, 12)
        }
    }
    
    private func signUp(){
        mainViewModel.showLoading()
        viewModel.doTask { result in
            mainViewModel.hideLoading()
            mainViewModel.showAlert(alert: AlertData(show:true, alert: AppAlert.ERROR(AppAlert.Content(title: "Error", description: "Signed Up Error"))))
        }
    }
}

struct SignUpSection_Previews: PreviewProvider {
    static var previews: some View {
        SignUpSection(viewModel: AuthenticationViewModel())
    }
}
