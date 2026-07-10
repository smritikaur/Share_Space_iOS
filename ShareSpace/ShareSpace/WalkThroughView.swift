import SwiftUI

struct WalkThroughView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Image("splashScreenLogo")
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
            
            Text("ShareSpace")
                .foregroundStyle(Color.white)
                .font(.system(size: 32, weight: .bold, design: .default))
                .padding(.leading, 10)
                .padding(.bottom, 5)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit")
                .foregroundStyle(Color.white)
                .font(.system(size: 20, weight: .thin, design: .default))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.bottom, 30)
            
            HStack(spacing: 6) {
                Capsule()
                    .fill(Color.white)
                    .frame(width: 40, height: 4)
                Capsule()
                    .fill(Color.white)
                    .frame(width: 40, height: 4)
            }
            .padding(.leading, 10)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 30)
            
            Button {
                print("Button tapped!")
            } label: {
                Text("Let's Go")
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
