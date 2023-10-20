//
//  LoginViewModel.swift
//  login-app-ios
//
//  Created by Gabriel Castelo De Azeredo Coutinho on 16/10/23.
//

import Foundation

class FakeAPI {
    func validateCredentials(username: String, password: String) async -> Bool {
        try! await Task.sleep(for: .seconds(1))
        if username == "username" && password == "password" {
            return true
        } else {
            return false
        }
    }
}

enum LoginViewState {
    case success, idle, failure, loading
}

@Observable
class LoginViewModel {
    var username: String
    var password: String
    private(set) var state: LoginViewState
    private let api: FakeAPI
    
    init(api: FakeAPI = FakeAPI()) {
        self.username = ""
        self.password = ""
        self.state = .idle
        self.api = api
    }
    
    
    func verify() async {
        state = .loading
        let isSuccessful = await api.validateCredentials(username: username, password: password)
        state = isSuccessful ? .success : .failure
    }
}
