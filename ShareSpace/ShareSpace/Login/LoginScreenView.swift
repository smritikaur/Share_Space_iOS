import SwiftUI

struct LoginScreenView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @AppStorage("email") var email: String = ""
    @AppStorage("firstName") var firstName: String = ""
    @AppStorage("lastName") var lastName: String = ""
    @AppStorage("userId") var userId: String = ""
    
    private var isSignedIn: Bool {
        !userId.isEmpty
    }
    var body: some View {
        NavigationView {
            VStack {
                if !isSignedIn {
                    SignInButtonView()
                } else {
                    // Signed In
                    Text("Welcome back!")
                }
            }
            .navigationTitle("Sign In")
        }
        
    }
}

#Preview {
    LoginScreenView()
}
