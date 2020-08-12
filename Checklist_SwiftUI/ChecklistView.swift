//
//  ContentView.swift
//  Checklist_SwiftUI
//
//  Created by Dávid Fejes on 2020. 08. 08..
//  Copyright © 2020. David Fejes. All rights reserved.
//

import SwiftUI

struct ChecklistView: View {
    
    // Properties
    // ==========
    
    @ObservedObject var checklist = Checklist()
    @State var newChecklistItemViewIsVisible = false
    
    // User interface content and layout
    var body: some View {
        NavigationView {
            List {
                ForEach(checklist.items) { checklistItem in
                    HStack {
                        Text(checklistItem.name)
                        Spacer()
                        Text(checklistItem.isChecked ? "✔" : "")
                    }
                        .background(Color(UIColor.systemBackground)) // This makes the entire row clickable
                        .onTapGesture {
                            if let matchingIndex = self.checklist.items.firstIndex(where: { $0.id == checklistItem.id }) {
                                self.checklist.items[matchingIndex].isChecked.toggle()
                            }
                    }
                }
                .onDelete(perform: checklist.deleteListItem)
                .onMove(perform: checklist.moveListItem)
            }
            .navigationBarItems(
                leading: Button(action: { self.newChecklistItemViewIsVisible = true }) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("Add Item")
                    }
                },
                trailing: EditButton())
                .navigationBarTitle("Checklist")
        }
        .sheet(isPresented: $newChecklistItemViewIsVisible) {
            NewChecklistItemView(checklist: self.checklist)
        }
    }
    
    
    // Methods
    // =======
    func printChecklistContents() {
            print("ASD")
        
    }
}


// Preview
// =======

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ChecklistView()
    }
}
