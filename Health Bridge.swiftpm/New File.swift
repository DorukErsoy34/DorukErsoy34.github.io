import SwiftUI

// WelcomeView (Opening Page)
struct WelcomeView: View {
    @Binding var showWelcomeView: Bool
    
    var body: some View {
        VStack(spacing: 20) {
            // App Logo or Icon
            Image(systemName: "heart.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.red)
            
            // App Name
            Text("Health First")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            
            // Tagline
            Text("Your go-to app for first aid information and health tips.")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
            
            // Get Started Button
            Button(action: {
                withAnimation {
                    showWelcomeView = false
                }
            }) {
                Text("Get Started")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.horizontal, 50)
            }
        }
        .padding()
    }
}
