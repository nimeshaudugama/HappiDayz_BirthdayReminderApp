//
//  TabView.swift
//  HappyDayz
//
//  Created by Nimesha Jayathissa on 2023-12-13.
//

import Foundation
import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            NavigationView {
                ContactsListView(viewModel: ContactsListViewModel()) // Provide viewModel here
            }
            .tabItem {
                Label("Contacts", systemImage: "person.3")
            }
            
            NavigationView {
                SettingsView()
            }
            .tabItem {
                Label("Settings", systemImage: "gear.circle.fill")
            }
        }
    }
}

