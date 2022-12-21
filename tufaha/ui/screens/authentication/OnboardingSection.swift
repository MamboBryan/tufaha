//
//  OnboardingSection.swift
//  tufaha
//
//  Created by MamboBryan on 21/12/2022.
//

import SwiftUI

struct OnboardingSection: View {
    
    var viewModel: AuthenticationViewModel
    
    var body: some View {
        VStack{
            Spacer()
            Text("OnBoarding...")
            Button("Next") {
                viewModel.updateAuthenticationState(state: .SIGN_IN)
            }.padding(.vertical, 12)
            
        }
    }
}

struct OnboardingSection_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingSection(viewModel: AuthenticationViewModel())
    }
}
