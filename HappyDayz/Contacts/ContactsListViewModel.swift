//
//  ContactsListViewModel.swift
//  HappyDayz
//
//  Created by Nimesha Jayathissa on 2023-10-24.
//

import SwiftUI
import Observation

@Observable
final class ContactsListViewModel {
    //TODO: Add properties and methods below to complete ViewModel
    
    
    
    // Observable properties
    var store: ContactStore
    var navTitle: String = ""
    var searchTerm: String = ""
    var searchResults: [Contact] = []
    
    // Computed Properties
    var listData: [Contact] {
        return searchTerm.isEmpty ? store.contacts : searchResults
    }
    
    var displayCount: String {
        return "\(listData.count) contacts"
    }
    
    var originalContacts: [Contact]
    
    
    init(store: ContactStore = ContactStore.testStore, navTitle: String = "Contacts") {
        self.store = store
        self.navTitle = navTitle
        self.originalContacts = store.contacts
    }
    
    func filterSearchResults() {
        searchResults = store.contacts.filter({
            $0.firstName.localizedCaseInsensitiveContains(searchTerm)
        })
        
    }
    
    
    func makeContact(contact: Contact){
        store.contacts.append(contact)
    }
    
    func deleteContact(offset: IndexSet){
        store.contacts.remove(atOffsets: offset)
    }
    
    func moveContacts(from: IndexSet, to: Int){
        store.contacts.move(fromOffsets: from, toOffset: to)
    }
    
    func resetContacts() {
        store.contacts = originalContacts
        searchTerm = ""
        searchResults = []
    }

}


