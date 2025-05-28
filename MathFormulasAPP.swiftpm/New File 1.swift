import SwiftUI

struct Formulas: View {
    let selectedTopic: String
    @Binding var viewHistory: [String]
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Selected Topic: \(selectedTopic)")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            Text(getFormulaText(for: selectedTopic))
                .font(.title2)
                .foregroundColor(.white)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.ignoresSafeArea())
        .onAppear {
            viewHistory.append(selectedTopic)
        }
    }
    
    func getFormulaText(for topic: String) -> String {
        var formulas: [String] = []
        
        switch topic {
        case "Functions":
            formulas = [
                "f(x) = ax + b",
                "Derivative: f'(x) = a"
            ]
            
        case "Algebra":
            formulas = [
                "Quadratic Formula: x = (-b ± √(b² - 4ac)) / 2a"
            ]
            
        case "Geometry":
            formulas = [
                "Area of a Circle: A = πr²",
                "Perimeter of a Square: P = 4s"
            ]
            
        case "Polynomials":
            formulas = [
                "x₁ + x₂ = -b/a",
                "x₁ × x₂ = c/a",
                "h = (x₁ + x₂) / 2",
                "Δ = b² - 4ac",
                "If Δ > 0 → Two distinct roots",
                "If Δ = 0 → Double root",
                "If Δ < 0 → No real roots",
                "Roots: x = (-b ± √Δ) / 2a"
            ]
            
        case "Trigonometry":
            formulas = [
                "sin²θ + cos²θ = 1",
                "tanθ = sinθ / cosθ",
                "sin(A ± B) = sinA cosB ± cosA sinB",
                "cos(A ± B) = cosA cosB ∓ sinA sinB"
            ]
            
        case "Statistics":
            formulas = [
                "Mean = (Σx) / n",
                "Median = Middle value (sorted data)",
                "Mode = Most frequent value",
                "Standard Deviation: σ = √(Σ(x - μ)² / n)"
            ]
            
        case "Calculus":
            formulas = [
                "Derivative of xⁿ = nxⁿ⁻¹",
                "∫xⁿ dx = xⁿ⁺¹ / (n + 1) + C",
                "Chain Rule: d/dx[f(g(x))] = f'(g(x)) · g'(x)",
                "Product Rule: d(uv)/dx = u'v + uv'"
            ]
            
        case "Logarithms":
            formulas = [
                "logₐ(xy) = logₐx + logₐy",
                "logₐ(x/y) = logₐx - logₐy",
                "logₐ(xⁿ) = n·logₐx",
                "Change of Base: logₐx = logbx / logba"
            ]
            
        case "Coordinate Geometry":
            formulas = [
                "Distance: d = √[(x₂ - x₁)² + (y₂ - y₁)²]",
                "Midpoint: M = ((x₁ + x₂)/2, (y₁ + y₂)/2)",
                "Slope: m = (y₂ - y₁) / (x₂ - x₁)",
                "Equation of a line: y = mx + c"
            ]
            
        default:
            return "No formulas available."
        }
        
        var result = ""
        for formula in formulas {
            result += formula + "\n"
        }
        
        return result
    }


}

