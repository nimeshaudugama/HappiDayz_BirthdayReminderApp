<<<<<<< HEAD
=======
//
//  ContactsListViewModel.swift
//  HappyDayz
//
//  Created by Nimesha Jayathissa on 2023-10-24.
//

>>>>>>> bd91f48cf0953ced3b54a4fc14f31dce5b7e6e3d
import SwiftUI
import Observation

@Observable
final class ContactsListViewModel {
<<<<<<< HEAD
    
=======
    //TODO: Add properties and methods below to complete ViewModel
    
    
    
    // Observable properties
>>>>>>> bd91f48cf0953ced3b54a4fc14f31dce5b7e6e3d
    var store: ContactStore
    var navTitle: String = ""
    var searchTerm: String = ""
    var searchResults: [Contact] = []
    
<<<<<<< HEAD
    var listData: [Contact]{
        return searchTerm.isEmpty ? store.contacts: searchResults
    }
    
    var displayCount : String{
        "\(listData.count) contacts"
    }
    
    init(store: ContactStore = ContactStore.testStore, navTitle: String = "Birthdays") {
        self.store = store
        self.navTitle = navTitle
    }
    
//    func filterSearchResults(){
//        searchResults = store.contacts.filter({
//            $0.fullName.localizedCaseInsensitiveContains(searchTerm)
//        })
//    }
    
=======
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
        searchResults = store.contacts.filter { contact in
            let searchTermLowercased = searchTerm.lowercased()
            return contact.firstName.localizedCaseInsensitiveContains(searchTermLowercased) ||
                   contact.lastName.localizedCaseInsensitiveContains(searchTermLowercased)
        }
    }

   
>>>>>>> bd91f48cf0953ced3b54a4fc14f31dce5b7e6e3d
    func makeContact(contact: Contact){
        store.contacts.append(contact)
    }
    
    func deleteContact(offset: IndexSet){
        store.contacts.remove(atOffsets: offset)
    }
    
    func moveContacts(from: IndexSet, to: Int){
        store.contacts.move(fromOffsets: from, toOffset: to)
    }
<<<<<<< HEAD
}
=======
    
    func resetContacts() {
        store.contacts = originalContacts
        searchTerm = ""
        searchResults = []
    }

}


>>>>>>> bd91f48cf0953ced3b54a4fc14f31dce5b7e6e3d
