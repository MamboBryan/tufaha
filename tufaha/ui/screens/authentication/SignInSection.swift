//
//  SignInSection.swift
//  tufaha
//
//  Created by MamboBryan on 21/12/2022.
//

import SwiftUI

struct SignInSection: View {
    
    @EnvironmentObject private var mainViewModel : ContentViewModel
    var viewModel: AuthenticationViewModel
    
    var body: some View {
        VStack{
            Spacer()
            Text("SignIn")
            Button("SignIn") {
                signIn()
            }.padding(.vertical, 12)
            Button("SignUp") {
                viewModel.updateAuthenticationState(state: .SIGN_UP)
            }.padding(.vertical, 12)
        }
    }
    
    private func signIn(){
        mainViewModel.showLoading()
        viewModel.doTask { result in
            mainViewModel.hideLoading()
            mainViewModel.showAlert(alert: AlertData(show:true, alert: AppAlert.SUCCESS(
                AppAlert.Content(title: "Success", description: "Signed In Okay")
            )))
        }
    }
    
}

struct SignInSection_Previews: PreviewProvider {
    static var previews: some View {
        SignInSection(viewModel: AuthenticationViewModel())
    }
}
