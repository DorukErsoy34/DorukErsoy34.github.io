import SwiftUI
struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                // Gradient Background (Dark Blue to Black)
                LinearGradient(gradient: Gradient(colors: [Color.black, Color.blue.opacity(0.8)]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack(spacing: 50) {
                    // Title Text
                    Text("Welcome to Math Library")
                        .font(.system(size: 36, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .shadow(color: .blue.opacity(0.5), radius: 10)
                    
                    // Circular Animated Button
                    NavigationLink(destination: MathOptions()) {
                        ZStack {
                            Circle()
                                .fill(LinearGradient(gradient: Gradient(colors: [Color.white, Color.blue.opacity(0.8)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                                .frame(width: 150, height: 150)
                                .shadow(color: Color.blue.opacity(0.7), radius: 10, x: 0, y: 5)
                                .overlay(
                                    Circle()
                                        .stroke(Color.white.opacity(0.8), lineWidth: 4)
                                )
                            
                            Text("Start")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                        }
                        .scaleEffect(1.05)
                        .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true), value: UUID())
                    }
                }
                .padding()
            }
        }
    }
}
