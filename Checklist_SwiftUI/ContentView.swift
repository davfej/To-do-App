//
//  ContentView.swift
//  Checklist_SwiftUI
//
//  Created by Dávid Fejes on 2020. 08. 08..
//  Copyright © 2020. David Fejes. All rights reserved.
//

import SwiftUI

struct ChecklistItem: Identifiable {
    let id = UUID() // 'UUID' is a built-in struct which generates a universally unique value every time it's called.
    var name: String
    var isChecked: Bool = false
}

struct ContentView: View {
    
    // Properties
    // ==========
    
    @State var checklistItems = [
        ChecklistItem(name: "Walk the dog", isChecked: false),
        ChecklistItem(name: "Brush my teeth", isChecked: false),
        ChecklistItem(name: "Learn iOS development", isChecked: true),
        ChecklistItem(name: "Soccer practice", isChecked: false),
        ChecklistItem(name: "Eat ice cream", isChecked: true),
    ]
    
    // User interface content and layout
    var body: some View {
        NavigationView {
            List {
                ForEach(checklistItems) { checklistItem in
                    HStack {
                        Text(checklistItem.name)
                        Spacer()
                        Text(checklistItem.isChecked ? "✅" : "🔲")
                    }
                        .background(Color(UIColor.systemBackground)) // This makes the entire row clickable
                        .onTapGesture {
                            if let matchingIndex = self.checklistItems.firstIndex(where: { $0.id == checklistItem.id }) {
                                self.checklistItems[matchingIndex].isChecked.toggle()
                            }
                    }
                }
                .onDelete(perform: deleteListItem)
                .onMove(perform: moveListItem)
            }
            .navigationBarItems(trailing: EditButton())
            .navigationBarTitle("Checklist")
        }
    }
    
    
    // Methods
    // =======
    
    func deleteListItem(whichElement: IndexSet) {
        checklistItems.remove(atOffsets: whichElement)
    }
    
    func moveListItem(whichElement: IndexSet, destination: Int) {
        checklistItems.move(fromOffsets: whichElement, toOffset: destination)
    }
    
}


// Preview
// =======

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
