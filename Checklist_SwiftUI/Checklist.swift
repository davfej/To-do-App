//
//  Checklist.swift
//  Checklist_SwiftUI
//
//  Created by Dávid Fejes on 2020. 08. 11..
//  Copyright © 2020. David Fejes. All rights reserved.
//

import Foundation

class Checklist: ObservableObject {

  // Properties
  // ==========

  @Published var items = [
    ChecklistItem(name: "Walk the dog", isChecked: false),
    ChecklistItem(name: "Brush my teeth", isChecked: false),
    ChecklistItem(name: "Learn iOS development", isChecked: true),
    ChecklistItem(name: "Soccer practice", isChecked: false),
    ChecklistItem(name: "Eat ice cream", isChecked: true),
  ]


  // Methods
  // =======
  
  func deleteListItem(whichElement: IndexSet) {
    items.remove(atOffsets: whichElement)
  }

  func moveListItem(whichElement: IndexSet, destination: Int) {
    items.move(fromOffsets: whichElement, toOffset: destination)
  }

  func printChecklistContents() {
    for item in items {
      print(item)
    }
  }

}
