import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var showingPassword = false
    @State private var showingConfirmPassword = false
    @State private var localError = ""
    @State private var showLocalError = false
    
    var body: some View {
        VStack(spacing: 20) {
            // Logo
            Circle()
                .fill(Color.black)
                .frame(width: 80, height: 80)
                .overlay(
                    Path { path in
                        path.move(to: CGPoint(x: 30, y: 30))
                        path.addCurve(
                            to: CGPoint(x: 50, y: 50),
                            control1: CGPoint(x: 40, y: 25),
                            control2: CGPoint(x: 55, y: 35)
                        )
                        path.addCurve(
                            to: CGPoint(x: 30, y: 60),
                            control1: CGPoint(x: 45, y: 65),
                            control2: CGPoint(x: 30, y: 50)
                        )
                    }
                    .stroke(Color.white, lineWidth: 3)
                )
                .padding(.top, 50)
            
            // Title
            Text("Create account")
                .font(.system(size: 32, weight: .bold))
                .padding(.top, 20)
            
            VStack(spacing: 15) {
                // Email field
                ZStack(alignment: .leading) {
                    if email.isEmpty {
                        Text("Email")
                            .foregroundColor(Color(.placeholderText))
                            .padding(.leading, 16)
                    }
                    
                    ZStack(alignment: .trailing) {
                        TextField("", text: $email)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color(.systemGray4), lineWidth: 1)
                            )
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .keyboardType(.emailAddress)
                        
                        if !email.isEmpty {
                            Button(action: {
                                email = ""
                            }) {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                }
                
                // Password field
                ZStack(alignment: .leading) {
                    if password.isEmpty {
                        Text("Password")
                            .foregroundColor(Color(.placeholderText))
                            .padding(.leading, 16)
                    }
                    
                    ZStack(alignment: .trailing) {
                        if showingPassword {
                            TextField("", text: $password)
                                .padding()
                                .background(Color(.systemGray6))
                                .cornerRadius(8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color(.systemGray4), lineWidth: 1)
                                )
                        } else {
                            SecureField("", text: $password)
                                .padding()
                                .background(Color(.systemGray6))
                                .cornerRadius(8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color(.systemGray4), lineWidth: 1)
                                )
                        }
                        
                        Button(action: {
                            showingPassword.toggle()
                        }) {
                            Image(systemName: showingPassword ? "eye.slash" : "eye")
                                .foregroundColor(.gray)
                                .padding(.trailing, 8)
                        }
                    }
                }
                
                // Confirm Password field
                ZStack(alignment: .leading) {
                    if confirmPassword.isEmpty {
                        Text("Confirm Password")
                            .foregroundColor(Color(.placeholderText))
                            .padding(.leading, 16)
                    }
                    
                    ZStack(alignment: .trailing) {
                        if showingConfirmPassword {
                            TextField("", text: $confirmPassword)
                                .padding()
                                .background(Color(.systemGray6))
                                .cornerRadius(8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color(.systemGray4), lineWidth: 1)
                                )
                        } else {
                            SecureField("", text: $confirmPassword)
                                .padding()
                                .background(Color(.systemGray6))
                                .cornerRadius(8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color(.systemGray4), lineWidth: 1)
                                )
                        }
                        
                        Button(action: {
                            showingConfirmPassword.toggle()
                        }) {
                            Image(systemName: showingConfirmPassword ? "eye.slash" : "eye")
                                .foregroundColor(.gray)
                                .padding(.trailing, 8)
                        }
                    }
                }
                
                // Register Button
                Button(action: {
                    if password != confirmPassword {
                        localError = "Passwords do not match"
                        showLocalError = true
                        return
                    }
                    
                    authViewModel.register(email: email, password: password)
                }) {
                    Text("Create Account")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(8)
                }
            }
            .padding(.horizontal)
            
            Spacer()
            
            // Footer
            HStack {
                Image(systemName: "p.circle.fill")
                    .resizable()
                    .frame(width: 24, height: 24)
                Text("Patreon")
                    .font(.headline)
                
                Spacer()
                
                Text("curated by")
                    .foregroundColor(.gray)
                Text("Mobbin")
                    .font(.headline)
                    .foregroundColor(.black)
            }
            .padding()
            .background(Color(.systemGray6))
        }
        .alert(localError, isPresented: $showLocalError) {
            Button("OK", role: .cancel) {}
        }
        .alert(authViewModel.errorMessage, isPresented: $authViewModel.showError) {
            Button("OK", role: .cancel) {}
        }
    }
}

#Preview {
    RegisterView()
        .environmentObject(AuthViewModel())
} 