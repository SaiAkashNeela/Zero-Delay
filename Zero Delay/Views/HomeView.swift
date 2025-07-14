import SwiftUI

struct HomeView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Welcome to Zero Delay")
                    .font(.largeTitle)
                    .padding()
                
                Text("You are successfully logged in!")
                    .font(.title2)
                    .padding()
                
                Button(action: {
                    authViewModel.signOut()
                }) {
                    Text("Sign Out")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 200)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(8)
                }
                .padding(.top, 50)
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(AuthViewModel())
} 