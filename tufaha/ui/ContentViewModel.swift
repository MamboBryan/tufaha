//
//  ContentViewModel.swift
//  tufaha
//
//  Created by MamboBryan on 21/12/2022.
//

import Foundation

struct LoadingData : Equatable {
    var show: Bool = false
    var msg: String = "loading..."
}

enum AppAlert {

    struct Content{
        let title: String
        let description: String
        var posBtn: String = "Yes"
        var negBtn: String = "No"
        var cancel: (()-> Void)? = nil
    }
    
    case DEFAULT, ERROR(Content),CONFIRM(Content, confirm:() -> Void),SUCCESS(Content)
    
}

struct AlertData : Equatable {
    
    var show: Bool = false
    var alert: AppAlert = AppAlert.DEFAULT

    static func == (lhs: AlertData, rhs: AlertData) -> Bool {
        lhs.show == rhs.show
    }
    
}

class ContentViewModel : ObservableObject {
    
    @Published var isAuthenticated: Bool = false
    
    @Published var loading : LoadingData = LoadingData(show: false)
    @Published var alert : AlertData = AlertData()

    func showLoading(message: String = ""){
        loading = LoadingData(show: true, msg: message)
    }
    
    func hideLoading(){
        loading = LoadingData(show: false)
    }
    
    func showAlert(alert: AlertData){
        self.alert = alert
    }
    
    func hideAlert(){
        alert = AlertData()
    }
    
    func signedIn(){
        isAuthenticated = true
    }
    
    func signedOut(){
        isAuthenticated = false
    }
    
}
