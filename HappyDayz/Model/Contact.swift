//
//  File.swift
//  HappyDayz
//
//  Created by Nimesha Jayathissa on 2023-10-24.
//


import Foundation

struct Contact: Identifiable {
    let id = UUID()
    let firstName: String
    let lastName: String
   
   
   
    
    
    
    internal init(firstName: String, lastName: String) {
        
        self.firstName = firstName
        self.lastName = lastName
        
        
      
    }
}
