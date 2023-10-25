//
//  INFO6131_Midterm_TemplateApp.swift
//  INFO6131-Midterm-Template
//

import SwiftUI

@main
struct HappyDayz_App: App {
    // Hint - Something could go here.. What could it be?
    
    var body: some Scene {
        WindowGroup {
            ContactsListView(viewModel: ContactsListViewModel())
        }
    }
}
