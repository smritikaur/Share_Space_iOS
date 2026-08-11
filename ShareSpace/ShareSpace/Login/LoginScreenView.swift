import SwiftUI
import AuthenticationServices

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

struct SignInButtonView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @AppStorage("email") var email: String = ""
    @AppStorage("firstName") var firstName: String = ""
    @AppStorage("lastName") var lastName: String = ""
    @AppStorage("userId") var userId: String = ""
    var body: some View {
        SignInWithAppleButton(.continue) { request in
            request.requestedScopes = [.email, .fullName]
        } onCompletion: { result in
            switch result {
            case .success(let auth):
                switch auth.credential {
                case let credential as ASAuthorizationAppleIDCredential:
                    // User Id
                    let userId = credential.user
                    
                    // User info
                    let email = credential.email
                    let firstName = credential.fullName?.givenName
                    let lastName = credential.fullName?.familyName
                    
                    self.email = email ?? ""
                    self.userId = userId
                    self.firstName = firstName ?? ""
                    self.lastName = lastName ?? ""
                    
                default:
                    break
                }
            case .failure(let error):
                print(error)
                
            }
        }
        .signInWithAppleButtonStyle(colorScheme == .dark ? .white : .black
        )
        .frame(height: 50)
        .padding()
        .cornerRadius(8)
        
    }
}

#Preview {
    LoginScreenView()
}
