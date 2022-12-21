//
//  ContentView.swift
//  tufaha
//
//  Created by MamboBryan on 21/12/2022.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var viewModel : ContentViewModel
    
    var body: some View {
        
        ZStack {
            
            MainScreen()
            
            if (viewModel.loading.show) {
                LoadingDialog(data: viewModel.loading)
            }
            
            if (viewModel.alert.show) {
                AlertDialog(alert: viewModel.alert.alert)
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
