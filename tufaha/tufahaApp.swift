//
//  tufahaApp.swift
//  tufaha
//
//  Created by MamboBryan on 21/12/2022.
//

import SwiftUI

@main
struct tufahaApp: App {
    
    @StateObject var viewModel = ContentViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(viewModel)
        }
    }
}
