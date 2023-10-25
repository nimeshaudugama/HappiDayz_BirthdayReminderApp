<<<<<<< HEAD
=======
//
//  ContactsListView.swift
//  HappyDayz
//
//  Created by Nimesha Jayathissa on 2023-10-24.
//

>>>>>>> bd91f48cf0953ced3b54a4fc14f31dce5b7e6e3d
import SwiftUI

/// Contact list view
struct ContactsListView: View {
    @State var viewModel: ContactsListViewModel
    
    var body: some View {
<<<<<<< HEAD
    
        NavigationStack{
            List{
                ForEach(viewModel.listData){ contact in
                        ContactRow(contact: contact)
                }
                .onMove(perform: moveContact)
                .onDelete(perform: deleteContact)
=======
        NavigationStack {
           
            
            List {
                ForEach(viewModel.listData) { contact in
                    ContactRow(contact: contact)
                    
                }
              
                
>>>>>>> bd91f48cf0953ced3b54a4fc14f31dce5b7e6e3d
                
                HStack{
                    Spacer()
                    Text(viewModel.displayCount)
<<<<<<< HEAD
                        .foregroundStyle(.secondary)
                    Spacer()
                }
            }
            .navigationTitle(viewModel.navTitle)
//            
//            .searchable(text: $viewModel.searchTerm, placement: .navigationBarDrawer(displayMode: .automatic), prompt: "Search for contacts")
//            
//            .onChange(of: viewModel.searchTerm) {
//                viewModel.filterSearchResults()
//            }
            .toolbar{
                HStack{
                    Button("Add"){
                        makeContact()
                    }
                    Spacer()
                    EditButton()
                }
            }
        }

    }
=======
                        .foregroundColor(.gray)
                    Spacer()
                    
                }
            }
            .navigationTitle(viewModel.navTitle)
            .searchable(text: $viewModel.searchTerm,placement: .navigationBarDrawer (displayMode:
                    .automatic), prompt: "Search for Contacts")
            .onChange(of: viewModel.searchTerm)
            {
                viewModel.filterSearchResults()
            }
            
                }
            }
        

    
>>>>>>> bd91f48cf0953ced3b54a4fc14f31dce5b7e6e3d
    
    func makeContact(){
        withAnimation{
            guard let randomContact = viewModel.store.contacts.randomElement() else {
                return
            }
            viewModel.makeContact(contact: randomContact)
        }
    }
    
<<<<<<< HEAD
    func deleteContact(offsets: IndexSet){
        withAnimation{
            viewModel.deleteContact(offset: offsets)
        }
    }
    
    func moveContact(from: IndexSet, to: Int){
        withAnimation{
            viewModel.moveContacts(from: from, to: to)
        }
    }
}

#Preview {
    ContactsListView(viewModel: ContactsListViewModel())
}
=======
    


}
    
    
    #Preview {
        ContactsListView(viewModel: ContactsListViewModel())
        
    }
    
>>>>>>> bd91f48cf0953ced3b54a4fc14f31dce5b7e6e3d

