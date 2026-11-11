import SwiftUI

@main
struct ShareSpaceApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(\.dependencies, .live)
        }
    }
}
