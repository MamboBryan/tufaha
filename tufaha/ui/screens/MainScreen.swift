//
//  MainScreen.swift
//  tufaha
//
//  Created by MamboBryan on 21/12/2022.
//

import SwiftUI

struct MainScreen: View {
    
    @EnvironmentObject var viewModel : ContentViewModel
    
    var body: some View {
        switch(viewModel.isAuthenticated){
        case true:
            NavigationView { Text("Authenticated") }
        case false:
            AuthenticationScreen()
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
