import SwiftUI

struct HomeScreenView: View {
    var body: some View {
        VStack {
            Text("Welcome to SharedSpace")
            Text("Login to continue")
            Text("Apple login button")
            Text("Google login button")
            Text("or")
            Text("Continue With Email")
            Text("Don't have an account? Sign up")
        }
    }
}

#Preview {
    HomeScreenView()
}
