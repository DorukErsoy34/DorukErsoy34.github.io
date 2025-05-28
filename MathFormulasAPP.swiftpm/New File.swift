import SwiftUI
struct MathOptions: View {
    let mathTopics = ["Functions", "Algebra", "Geometry", "Polynomials", "Trigonometry", "Statistics", "Calculus", "Logarithms", "Coordinate Geometry"]
    
    @State private var viewHistory: [String] = []
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 20) {
                    Text("Select the topic")
                        .font(.system(size: 36, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .shadow(color: .blue.opacity(0.5), radius: 10)
                        .padding(.bottom, 20)
                    
                    ForEach(mathTopics, id: \.self) { topic in
                        NavigationLink(destination: Formulas(selectedTopic: topic, viewHistory: $viewHistory)) {
                            TopicButton(title: topic)
                        }
                    }
                    
                    if !viewHistory.isEmpty {
                        NavigationLink(destination: RecentlyViewedView(history: viewHistory)) {
                            Text("Recently Viewed")
                                .font(.title3)
                                .fontWeight(.bold)
                                .frame(width: 300, height: 50)
                                .background(LinearGradient(gradient: Gradient(colors: [Color.white, Color.blue.opacity(0.8)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                                .foregroundColor(.black)
                                .cornerRadius(10)
                                .shadow(color: Color.blue.opacity(0.7), radius: 10, x: 0, y: 5)
                        }
                        .padding(.top, 30)
                    }
                }
                .padding()
            }
        }
    }
}
struct RecentlyViewedView: View {
    let history: [String]
    
    var body: some View {
        VStack(spacing: 15) {
            Text("Recently Viewed Topics")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding()
            
            List {
                ForEach(history.indices, id: \.self) { index in
                    Text(history[index])
                        .font(.headline)
                }
                .listRowBackground(Color.black)
            }
        }
        .background(Color.black.ignoresSafeArea())
    }
}
struct TopicButton: View {
    let title: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color.white, Color.blue.opacity(0.8)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 300, height: 50)
                .shadow(color: Color.blue.opacity(0.7), radius: 10, x: 0, y: 5)
                .cornerRadius(10)
            
            Text(title)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.black)
        }
        .padding(.vertical, 5)
    }
}
