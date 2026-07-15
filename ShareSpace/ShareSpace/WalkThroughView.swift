import SwiftUI

struct WalkThroughView: View {
    let items = WalkThroughModel.onboardingFlow
    @State private var currentnIndex = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(items[currentnIndex].image!)
                .resizable()
                .frame(width: 100.0, height: 110.0)
                .background(Color.red)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(Color.white, lineWidth: 0.5)
                        .shadow(color: Color.white.opacity(0.8), radius: 4, x: 0, y: 0)
                        .shadow(color: Color.white.opacity(0.4), radius: 12, x: 0, y: 0)
                )
                .padding(.leading, 10)
                .padding(.bottom, 8)
            
            Text(items[currentnIndex].title)
                .foregroundStyle(Color.white)
                .font(.system(size: 32, weight: .bold, design: .default))
                .padding(.leading, 10)
                .padding(.bottom, 5)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(items[currentnIndex].subTitle)
                .foregroundStyle(Color.white)
                .font(.system(size: 20, weight: .thin, design: .default))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.bottom, 30)
            
            HStack(spacing: 6) {
                ForEach(Array(items.enumerated()), id: \.offset) { index, item in
                    Capsule()
                        .fill(Color.white)
                        .frame(width: 40, height: 4)
                        .opacity(index <= currentnIndex ? 1.0 : 0.0)
                        .animation(.default, value: currentnIndex)
                    
                }
            }
            .padding(.leading, 10)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 30)
            
            Button {
                print("Button tapped!")
                currentnIndex += 1
                if currentnIndex > 2 {
                    currentnIndex = 0
                }
            } label: {
                Text("Next")
                    .font(.headline)
                    .foregroundColor(Color.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("MonsterShadeTwo"))
                    .cornerRadius(12)
            }
            .padding(.horizontal, 10)
        }
        .edgesIgnoringSafeArea(.all)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .padding(.bottom, 30)
        .background(Color.black)
    }
}

#Preview {
    WalkThroughView()
}
