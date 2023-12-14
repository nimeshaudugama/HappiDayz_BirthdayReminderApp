//
//  CalenderView.swift
//  HappyDayz
//
//  Created by Sharan Balraj on 2023-12-13.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedDate: Date = Date()
    @State private var reminders: [String: [String]] = [:]
    @State private var newReminder: String = ""

    var body: some View {
        VStack {
            // Calendar View
            CalendarView(selectedDate: $selectedDate)
            
            // Reminder List
            List {
                ForEach(reminders.keys.sorted(by: <), id: \.self) { dateKey in
                    Section(header: Text(dateKey).font(.headline)) {
                        ForEach(reminders[dateKey]!, id: \.self) { reminder in
                            Text(reminder)
                        }
                    }
                }
            }
//            NavigationLink(destination: ContactsListView(viewModel: ContactsListViewModel())) {
//                                Text("Go to Contacts")
//                                    .padding()
//                                    .background(Color.blue)
//                                    .foregroundColor(.white)
//                                    .cornerRadius(10)
//                            }
            
            // Add Reminder
            HStack {
                TextField("New Event", text: $newReminder)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Save Event") {
                    addReminder()
                }
            }
            .padding()
        }
        .padding()
    }

    private func addReminder() {
        let dateKey = formatDate(selectedDate)
        if var existingReminders = reminders[dateKey] {
            existingReminders.append(newReminder)
            reminders[dateKey] = existingReminders
        } else {
            reminders[dateKey] = [newReminder]
        }
        newReminder = ""
    }

    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy"
        return formatter.string(from: date)
    }
}

struct CalendarView: View {
    @Binding var selectedDate: Date

    var body: some View {
        DatePicker("Select a Date", selection: $selectedDate, displayedComponents: .date)
            .datePickerStyle(GraphicalDatePickerStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


#Preview {
    ContentView()
}
