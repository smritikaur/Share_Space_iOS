import Foundation

struct WalkThroughModel: Identifiable {
    let id = UUID()
    let image: String?
    let title: String
    let subTitle: String
}

extension WalkThroughModel {
    static let onboardingFlow: [WalkThroughModel] = [
        WalkThroughModel(image: "splashScreenLogo", title: "First Walkthrough", subTitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"),
        WalkThroughModel(image: "splashScreenLogo", title: "Second Walkthrough", subTitle: "Sed ut perspiciatis unde omnis iste natus error"),
        WalkThroughModel(image: "splashScreenLogo", title: "Third Walkthrough", subTitle: "At vero eos et accusamus et iusto odio dignissimos")
    ]
}
