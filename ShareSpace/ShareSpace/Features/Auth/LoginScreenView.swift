import SwiftUI

/// Sign-in screen. `RootView` switches to the main tabs once `SignInButtonView`
/// stores a `userId`, so this view no longer decides what comes after sign-in.
struct LoginScreenView: View {
    var body: some View {
        VStack {
            SignInButtonView()
        }
    }
}

#Preview {
    LoginScreenView()
}
