
import SwiftUI

struct ContactsListView: View {
    @State var viewModel: ContactsListViewModel
    @State private var isSettingsPresented = false

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.listData) { contact in
                    ContactRow(contact: contact)
                }
                
                HStack {
                    Spacer()
                    Text(viewModel.displayCount)
                        .foregroundColor(.gray)
                    Spacer()
                }
            }
            .navigationTitle(viewModel.navTitle)
            .searchable(text: $viewModel.searchTerm, placement: .navigationBarDrawer(displayMode: .automatic), prompt: "Search for Contacts")
            .navigationBarItems(trailing: settingsButton)
            .sheet(isPresented: $isSettingsPresented) {
                ReminderView()
            }
        }
    }
    
    var settingsButton: some View {
        Button("Settings") {
            isSettingsPresented = true
        }
    }
}


struct ContactsListView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsListView(viewModel: ContactsListViewModel())
    }
}

