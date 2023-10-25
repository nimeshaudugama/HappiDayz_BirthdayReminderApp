//
//  ContactDetail.swift
//  HappyDayz
//
//  Created by Nimesha Jayathissa on 2023-10-24.
//

import SwiftUI

struct ContactDetail: View {
    @State private var isCalendarPresented = false
    @State private var selectedDate = Date()
    //image
    @State private var isShowingImagePicker = false
    @State private var selectedImage: Image?
    
    
    
    let contact: Contact
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                HStack {
                    Text(contact.firstName)
                        .font(.system(size: 30, weight: .bold))
                    
                    Text(contact.lastName)
                        .font(.system(size: 30, weight: .bold))
                    
                    
                }
                //image
                VStack {
                    selectedImage?
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(10)
                        .padding()
                    
                    Button(action: {
                        isShowingImagePicker.toggle()
                    }) {
                        Text("Take Picture")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    .sheet(isPresented: $isShowingImagePicker) {
                        ImagePicker(selectedImage: $selectedImage)
                    }
                    
                    
                    
                    
                    
                    VStack(alignment: .leading) {
                        Divider()
                        HStack {
                            Text("Phone:")
                                .frame(alignment: .leading)
                                .padding()
                            Text(contact.phone)
                                .padding()
                                .foregroundColor(.gray)
                        }
                        Divider()
                        HStack {
                            Text("Email:")
                                .frame(alignment: .leading)
                                .padding()
                            Text(contact.email)
                                .padding()
                                .foregroundColor(.gray)
                        }
                        Divider()
                        HStack {
                            Text("Address:")
                                .frame(alignment: .leading)
                                .padding()
                            Text(contact.address + ",")
                                .foregroundColor(.gray)
                            Text(contact.city + ",")
                                .foregroundColor(.gray)
                            Text(contact.country)
                                .foregroundColor(.gray)
                        }
                        Divider()
                        HStack {
                            Text("Birthday:")
                                .frame(alignment: .leading)
                                .padding()
                            Button(action: {
                                // Show the calendar dialog when the button is tapped
                                isCalendarPresented.toggle()
                            }) {
                                Text(contact.birthday)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .sheet(isPresented: $isCalendarPresented) {
                    // Present your calendar dialog here
                    CalendarDialog(selectedDate: $selectedDate)
                }
                //            .navigationTitle("Contact Details")
                //            .navigationBarItems(leading: Button("Back") {
                //                // Handle the action to go back
                //                isCalendarPresented.toggle() // Close the calendar dialog
                //            })
            }
        }
    }
    
    struct CalendarDialog: View {
        @Binding var selectedDate: Date
        
        var body: some View {
            NavigationView {
                DatePicker("Select a Date", selection: $selectedDate, displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .labelsHidden()
                    .navigationTitle("Contact Details")
                    .navigationBarItems(leading: Button("Back") {
                        
                        // Handle the action to go back
                    })
            }
        }
    }
    struct ContactDetail_Previews: PreviewProvider {
        static var previews: some View {
            ContactDetail(contact: ContactStore.testStore.contacts[0])
        }
    }
    
    struct ImagePicker: UIViewControllerRepresentable {
        @Binding var selectedImage: Image?
        
        func makeUIViewController(context: Context) -> UIImagePickerController {
            let picker = UIImagePickerController()
            picker.delegate = context.coordinator
            return picker
        }
        
        func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        }
        
        func makeCoordinator() -> Coordinator {
            Coordinator(self)
        }
        
        class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
            var parent: ImagePicker
            
            init(_ parent: ImagePicker) {
                self.parent = parent
            }
            
            func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
                parent.selectedImage = nil
                parent.selectedImage = Image(systemName: "camera")
                picker.dismiss(animated: true)
            }
            
            func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
                if let uiImage = info[.originalImage] as? UIImage {
                    parent.selectedImage = Image(uiImage: uiImage)
                }
                picker.dismiss(animated: true)
            }
        }
    }}

// Usage:
// ContactDetail(contact: ContactStore.testStore.contacts[0])


