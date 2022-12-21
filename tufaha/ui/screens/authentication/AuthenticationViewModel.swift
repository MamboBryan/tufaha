//
//  AuthenticationViewModel.swift
//  tufaha
//
//  Created by MamboBryan on 21/12/2022.
//

import Foundation
import SwiftUI

enum AuthState{
    case ON_BOARDING, SIGN_IN, SIGN_UP
}

class AuthenticationViewModel : ObservableObject {
    
    @Published var authState = AuthState.ON_BOARDING
        
    func updateAuthenticationState(state: AuthState){
        authState = state
    }
    
    func doTask(callback : @escaping (_ result : (Bool, String)) -> Void){
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { // Change `2.0` to the desired number of seconds.
            callback((true, "ItWasHere"))
        }
    }
    
}
