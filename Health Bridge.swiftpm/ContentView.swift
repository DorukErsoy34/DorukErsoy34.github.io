import SwiftUI

struct ContentView: View {
    @State private var chatbotResponse: String = "Welcome to HealthBridge! How can I assist you today? Press one of the buttons to get assistance"
    @State private var showSymptomChecker: Bool = false
    @State private var showFirstAid: Bool = false
    @State private var showTelemedicine: Bool = false
    @State private var selectedSymptoms: Set<String> = []
    @State private var selectedTeleSymptoms: Set<String> = []
    
    let symptomsOptions = ["Headache", "Fever", "Cough", "Sore Throat", "Fatigue", "Nausea"]
    let firstAidOptions = ["Burns", "Cuts", "Fever", "Sprain", "Choking", "Fracture"]
    let telemedicineOptions = ["Chest Pain", "Shortness of Breath", "Dizziness", "Abdominal Pain", "Skin Rash", "Joint Pain"]
    
    var body: some View {
        VStack(spacing: 10) { 
            // Chatbot Response
            
            Text(chatbotResponse)
                .font(.title)
                .multilineTextAlignment(.center)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)



            
            
            // Symptom Checker Section
            if showSymptomChecker {
                VStack(spacing: 10) {
                    Text("Select your symptoms:")
                        .font(.headline)
                    
                    ForEach(symptomsOptions, id: \.self) { symptom in
                        Toggle(symptom, isOn: Binding(
                            get: { selectedSymptoms.contains(symptom) },
                            set: { newValue in
                                if newValue { selectedSymptoms.insert(symptom) }
                                else { selectedSymptoms.remove(symptom) }
                            }
                        ))
                        .toggleStyle(SwitchToggleStyle(tint: .green))
                    }
                    
                    Button(action: analyzeSymptoms) {
                        Text("Check Symptoms")
                            .font(.title2)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                .padding()
            }
            
            // First-Aid Section
            if showFirstAid {
                VStack(spacing: 10) {
                    Text("Select a first-aid topic:")
                        .font(.headline)
                    
                    ForEach(firstAidOptions, id: \.self) { option in
                        Button(action: { showFirstAidInstructions(option: option) }) {
                            Text(option)
                                .font(.title2)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.orange)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                }
                .padding()
            }
            
            // Telemedicine Section
            if showTelemedicine {
                VStack(spacing: 10) {
                    Text("Select additional symptoms:")
                        .font(.headline)
                    
                    ForEach(telemedicineOptions, id: \.self) { symptom in
                        Toggle(symptom, isOn: Binding(
                            get: { selectedTeleSymptoms.contains(symptom) },
                            set: { newValue in
                                if newValue { selectedTeleSymptoms.insert(symptom) }
                                else { selectedTeleSymptoms.remove(symptom) }
                            }
                        ))
                        .toggleStyle(SwitchToggleStyle(tint: .blue))
                    }
                    
                    Button(action: diagnoseTelemedicine) {
                        Text("Get Diagnosis")
                            .font(.title2)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                .padding()
            }
            
            Spacer() // Push the bottom navigation to the bottom
            
            // Footer Navigation (Always visible at the bottom)
            HStack {
                Button(action: { showSymptomChecker = true; showFirstAid = false; showTelemedicine = false }) {
                    Text("Symptom Checker")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.purple)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                Button(action: { showFirstAid = true; showSymptomChecker = false; showTelemedicine = false }) {
                    Text("First-Aid")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                Button(action: { showTelemedicine = true; showSymptomChecker = false; showFirstAid = false }) {
                    Text("Other Symptoms")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
            .background(Color(.systemBackground)) // Ensure the buttons are visible
        }
        .navigationTitle("HealthBridge")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // Analyze Symptoms
    func analyzeSymptoms() {
        if selectedSymptoms.isEmpty {
            chatbotResponse = "Please select at least one symptom."
        } else {
            chatbotResponse = "Based on your symptoms (\(selectedSymptoms.joined(separator: ", "))), you might have a common cold or flu. If symptoms persist, consult a doctor."
            showSymptomChecker = false
        }
    }
    
    // Show First-Aid Instructions
    func showFirstAidInstructions(option: String) {
        switch option {
        case "Burns":
            chatbotResponse = "1. Cool the burn under cold water for 10-15 minutes.\n2. Apply an antibiotic ointment.\n3. Cover with a clean bandage."
            
        case "Cuts":
            chatbotResponse = "1. Clean the cut with water.\n2. Apply pressure to stop bleeding.\n3. Cover with a sterile bandage."
            
        case "Fever":
            chatbotResponse = "1. Rest and stay hydrated.\n2. Use a cold compress.\n3. Take fever medicine if necessary."
            
        case "Sprain":
            chatbotResponse = "1. Apply ice to reduce swelling.\n2. Elevate the injured area.\n3. Use a bandage to compress."
            
        case "Choking":
            chatbotResponse = "1. Encourage coughing.\n2. Perform the Heimlich maneuver if necessary.\n3. Seek emergency help if breathing is blocked."
            
        case "Fracture":
            chatbotResponse = "1. Keep the injured area still.\n2. Apply a splint if necessary.\n3. Seek medical attention immediately."
            
        default:
            chatbotResponse = "Invalid option selected."
        }
        showFirstAid = false
    }
    
    // Diagnose via Telemedicine
    func diagnoseTelemedicine() {
        chatbotResponse = "Based on your symptoms (\(selectedTeleSymptoms.joined(separator: ", "))), we recommend monitoring your condition and consulting a healthcare provider if needed."
        showTelemedicine = false
    }
}

// Wrapper View (Controls Welcome Screen Transition)
struct AppContentView: View {
    @State private var showWelcomeView: Bool = true
    
    var body: some View {
        ZStack {
            if showWelcomeView {
                WelcomeView(showWelcomeView: $showWelcomeView)
                    .transition(.opacity)
            } else {
                ContentView()
                    .transition(.opacity)
            }
        }
        .animation(.easeInOut(duration: 0.5), value: showWelcomeView)
    }
}
