//
//  ReminderView.swift
//  HappyDayz
//
//  Created by Sharan Balraj on 2023-10-24.
//

import Foundation

import SwiftUI

struct ReminderView: View {
    @State private var isReminderEnabled = false
    @State private var showAlert = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView{
            VStack(alignment: .center, spacing: 0.0) {
                Toggle("Birthday Reminder's", isOn: $isReminderEnabled)
                    .padding()
                    .onChange(of: isReminderEnabled) { newValue in
                        showAlert = true
                    }
                Spacer()
                
            }
            
            
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text(isReminderEnabled ? "Reminder Turned ON":"Reminder Turned OFF" ),
                    dismissButton: .default(Text("OK"))
                )
            }
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
    
    
    
    struct ReminderToggleView_Previews: PreviewProvider {
        static var previews: some View {
            ReminderView()
        }
    }
}
