//
//  AuthenticationScreen.swift
//  tufaha
//
//  Created by MamboBryan on 21/12/2022.
//

import SwiftUI

struct AuthenticationScreen: View {
    
    @StateObject private var authenticationViewModel : AuthenticationViewModel = AuthenticationViewModel()
    
    var body: some View {
        
        ZStack {
            
            switch(authenticationViewModel.authState){
            case AuthState.ON_BOARDING:
                OnboardingSection(viewModel: authenticationViewModel)
            case AuthState.SIGN_IN:
                SignInSection(viewModel: authenticationViewModel)
            case AuthState.SIGN_UP:
                SignUpSection(viewModel: authenticationViewModel)
            }
            
        }
        
    }
}

struct AuthenticationScreen_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationScreen()
    }
}
