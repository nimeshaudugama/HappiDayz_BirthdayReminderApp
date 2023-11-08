//
//  ReminderView.swift
//  HappyDayz
//
//  Created by Sharan Balraj on 2023-11-06.
//

import SwiftUI

struct ReminderView: View {
    @State private var isReminderEnabled = false
    @Environment(\.presentationMode) var presentationMode
 
    var body: some View {
        NavigationView {
            VStack {
                Toggle("Birthday Reminder", isOn: $isReminderEnabled)
                    .padding()
                    .onChange(of: isReminderEnabled) { newValue in
                        if newValue{
                            toggleSwitchOn()
                        } else {
                            print("Toggle is turned off")
                        }
                        
                    }

                Spacer()
                Button("Request Permission"){
                    UNUserNotificationCenter.current() .requestAuthorization(options: [.alert, .badge,. sound]) { success, error in if success {
                        print("All set!")
                    } else if let error = error {
                        print(error.localizedDescription)
                    }
                    }
                }
            }
            .navigationBarTitle("Settings", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        HStack {
                            Image(systemName: "chevron.left")
                            Text("Back")
                            
                        }
                    }
                }
            }
            
        }
    }
     
    func toggleSwitchOn() {
        let content = UNMutableNotificationContent()
        content.title = "Reminder"
        content.subtitle = "John Doe's birthday today!"
        content.sound = UNNotificationSound.default
        let trigger = UNTimeIntervalNotificationTrigger (timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: UUID() .uuidString, content: content,
                                            trigger: trigger)
        UNUserNotificationCenter .current().add(request)

    }
}

#Preview {
    ReminderView()
}
