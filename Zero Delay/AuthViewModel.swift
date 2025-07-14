import Foundation
import SwiftUI

class AuthViewModel: ObservableObject {
    @Published var isAuthenticated = false
    @Published var email = ""
    @Published var password = ""
    @Published var showError = false
    @Published var errorMessage = ""
    
    func login(email: String, password: String) {
        // Validate email
        guard isValidEmail(email) else {
            self.errorMessage = "Please enter a valid email address"
            self.showError = true
            return
        }
        
        // Validate password
        guard password.count >= 6 else {
            self.errorMessage = "Password must be at least 6 characters"
            self.showError = true
            return
        }
        
        // Simulate network delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            // For demo purposes, always succeed
            self.isAuthenticated = true
        }
    }
    
    func register(email: String, password: String) {
        // Validate email
        guard isValidEmail(email) else {
            self.errorMessage = "Please enter a valid email address"
            self.showError = true
            return
        }
        
        // Validate password
        guard password.count >= 6 else {
            self.errorMessage = "Password must be at least 6 characters"
            self.showError = true
            return
        }
        
        // Simulate network delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            // For demo purposes, always succeed
            self.isAuthenticated = true
        }
    }
    
    func signOut() {
        isAuthenticated = false
        email = ""
        password = ""
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
} 