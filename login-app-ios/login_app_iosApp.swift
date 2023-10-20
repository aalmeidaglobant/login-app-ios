//
//  login_app_iosApp.swift
//  login-app-ios
//
//  Created by Gabriel Castelo De Azeredo Coutinho on 11/10/23.
//

import SwiftUI

@main
struct login_app_iosApp: App {
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .onChange(of: scenePhase) { oldValue, newValue in
            print("\(oldValue) -> \(newValue)")
            switch newValue {
            case .active:
                return
            case .background:
                return
            case .inactive:
                return
            @unknown default:
                return
            }
        }
    }
}
