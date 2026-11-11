import SwiftUI

/// Top-level switch between the app's three phases: onboarding, sign-in, and the main tabs.
/// Each phase replaces the previous one instead of being pushed onto a navigation stack,
/// so there is no back button from the tabs to login or onboarding.
struct RootView: View {
    // Written by `SignInButtonView` on Apple sign-in success. Keep the key in sync.
    @AppStorage("userId") private var userId: String = ""

    // Not persisted: onboarding shows on every launch until the user is signed in.
    @State private var hasFinishedOnboarding = false

    private var isSignedIn: Bool {
        !userId.isEmpty
    }

    var body: some View {
        Group {
            if isSignedIn {
                MainTabView()
            } else if !hasFinishedOnboarding {
                WalkThroughView {
                    hasFinishedOnboarding = true
                }
            } else {
                LoginScreenView()
            }
        }
        .animation(.default, value: isSignedIn)
        .animation(.default, value: hasFinishedOnboarding)
    }
}

#Preview {
    RootView()
}
