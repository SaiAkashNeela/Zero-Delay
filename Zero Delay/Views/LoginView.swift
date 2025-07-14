import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @State private var email = ""
    @State private var password = ""
    @State private var showingPassword = false
    
    var body: some View {
        VStack(spacing: 30) {
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
            Text("Log in or sign up")
                .font(.system(size: 32, weight: .bold))
                .padding(.top, 20)
            
            // Email field
            VStack(spacing: 15) {
                ZStack(alignment: .leading) {
                    if email.isEmpty {
                        Text("jsmith.mobbin1@gmail.com")
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
                
                // Continue Button
                Button(action: {
                    authViewModel.login(email: email, password: password)
                }) {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(8)
                }
                
                // OR Divider
                HStack {
                    VStack { Divider() }
                    Text("or")
                        .foregroundColor(.gray)
                        .padding(.horizontal, 8)
                    VStack { Divider() }
                }
                .padding(.vertical, 8)
                
                // Social Login Buttons
                Button(action: {
                    // Google login action
                }) {
                    HStack {
                        Image(systemName: "globe")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("Continue with Google")
                            .font(.headline)
                            .foregroundColor(.black)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color(.systemGray4), lineWidth: 1)
                    )
                }
                
                Button(action: {
                    // Apple login action
                }) {
                    HStack {
                        Image(systemName: "apple.logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                        Text("Continue with Apple")
                            .font(.headline)
                            .foregroundColor(.black)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color(.systemGray4), lineWidth: 1)
                    )
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
        .alert(authViewModel.errorMessage, isPresented: $authViewModel.showError) {
            Button("OK", role: .cancel) {}
        }
    }
}

#Preview {
    LoginView()
        .environmentObject(AuthViewModel())
} 