import SwiftUI

/// The app's composition root: every service a feature needs (API client, repositories,
/// session store, ...) is created once here and handed down through the SwiftUI environment.
///
/// - `live` is used by the running app (injected in `ShareSpaceApp`).
/// - `preview` is used by SwiftUI previews and tests, and will hold mock implementations.
///
/// Services are added here as the foundation layer is built (APIClient, Keychain session, repositories).
nonisolated struct AppDependencies: Sendable {
    static let live = AppDependencies()
    static let preview = AppDependencies()
}

extension EnvironmentValues {
    /// Defaults to `.preview` so previews never touch real services by accident.
    /// The app injects `.live` explicitly at the root.
    @Entry var dependencies: AppDependencies = .preview
}
