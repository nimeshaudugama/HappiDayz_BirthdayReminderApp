//
//  Settings.swift
//  HappyDayz
//
//  Created by Nimesha Jayathissa on 2023-12-13.
//
import Foundation
import SwiftUI

struct SettingsView: View {
    @State private var remindersEnabled = false
    @State private var selectedLanguage = LanguageManager.shared.currentLanguage

    var body: some View {
        Form {
            Section(header: Text("Reminders")) {
                Toggle(isOn: $remindersEnabled, label: {
                    Text("Enable Reminders")
                })
            }

            Section(header: Text("Select Language")) {
                Picker("Language", selection: $selectedLanguage) {
                    ForEach(["en", "fr"], id: \.self) { language in
                        Text(self.languageName(for: language)).tag(language)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .onChange(of: selectedLanguage) { newValue in
                    LanguageManager.shared.setLanguage(newValue)
                }
            }
        }
        .onAppear {
//            self.remindersEnabled = /* Fetch reminder status from UserDefaults or wherever it's stored */
        }
        .onChange(of: remindersEnabled) { newValue in
            // Handle reminders toggle change and update UserDefaults or wherever it needs to be stored
        }
    }

    func languageName(for code: String) -> String {
        // Return the proper language name based on language code
        switch code {
        case "en": return "English"
        case "fr": return "French"
        default: return ""
        }
    }
}

