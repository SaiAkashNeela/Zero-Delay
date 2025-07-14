//
//  ContentView.swift
//  Zero Delay
//
//  Created by Sai Akash Neela on 14/07/2025.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @State private var showingRegister = false
    
    var body: some View {
        NavigationStack {
            if authViewModel.isAuthenticated {
                HomeView()
            } else {
                if showingRegister {
                    RegisterView()
                        .toolbar {
                            ToolbarItem(placement: .navigationBarLeading) {
                                Button(action: {
                                    showingRegister = false
                                }) {
                                    HStack {
                                        Image(systemName: "chevron.left")
                                        Text("Back")
                                    }
                                }
                            }
                        }
                } else {
                    LoginView()
                        .toolbar {
                            ToolbarItem(placement: .navigationBarTrailing) {
                                Button(action: {
                                    showingRegister = true
                                }) {
                                    Text("Register")
                                        .fontWeight(.semibold)
                                }
                            }
                        }
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(AuthViewModel())
}
