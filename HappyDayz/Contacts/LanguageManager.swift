//
//  LanguageManager.swift
//  HappyDayz
//
//  Created by Nimesha Jayathissa on 2023-12-13.
//

//import Foundation
//
//class LanguageManager: ObservableObject {
//    static let shared = LanguageManager()
//
//    @Published var currentLanguage = "en" // Default language code, e.g., "en" for English
//
//    func setLanguage(_ languageCode: String) {
//        currentLanguage = languageCode
//    }
//
//    func localizedString(_ key: String) -> String {
//        let path = Bundle.main.path(forResource: currentLanguage, ofType: "lproj")
//        let bundle = Bundle(path: path!) ?? Bundle.main
//        return NSLocalizedString(key, bundle: bundle, comment: "")
//    }
//}


import Foundation

class LanguageManager: ObservableObject {
    static let shared = LanguageManager()

    @Published var currentLanguage: String {
        didSet {
            UserDefaults.standard.set(currentLanguage, forKey: "SelectedLanguage")
        }
    }

    init() {
        if let savedLanguage = UserDefaults.standard.string(forKey: "SelectedLanguage") {
            self.currentLanguage = savedLanguage
        } else {
            // Default language is English
            self.currentLanguage = "en"
            UserDefaults.standard.set("en", forKey: "SelectedLanguage")
        }
    }

    func setLanguage(_ languageCode: String) {
        // Set only if the language is different from the current one
        if currentLanguage != languageCode {
            currentLanguage = languageCode
        }
    }

    func localizedString(_ key: String) -> String {
        var fileName = "Localizable"

        // If the current language is English, use the default name "Localizable"
        if currentLanguage == "en" {
            fileName = "Localizable"
        } else {
            // For other languages, append the language code
            fileName += currentLanguage.capitalized
        }

        if let path = Bundle.main.path(forResource: fileName, ofType: "strings") {
            let bundle = Bundle(path: path) ?? Bundle.main
            return NSLocalizedString(key, tableName: nil, bundle: bundle, value: "", comment: "")
        }

        // Return an empty string if localization fails
        return ""
    }
}
