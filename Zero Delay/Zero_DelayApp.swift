//
//  Zero_DelayApp.swift
//  Zero Delay
//
//  Created by Sai Akash Neela on 14/07/2025.
//

import SwiftUI

@main
struct Zero_DelayApp: App {
    @StateObject var authViewModel = AuthViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(authViewModel)
        }
    }
}
