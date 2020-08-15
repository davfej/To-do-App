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
    
    @Published var items: [ChecklistItem] = []
    
    
    // Methods
    // =======
    
    init() {
        loadChecklistItems() //LOADS THE ITEMS
    }
    
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
    
    //MARK: - File Management
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory,
                                             in: .userDomainMask)
        
        let directory = paths[0]
        print("Documents directory is: \(directory)")
        return directory
    }
    
    func dataFilePath() -> URL {
        let filePath = documentsDirectory().appendingPathComponent("Checklist.plist")
        print("Data file path is \(filePath)")
        return filePath
    }
    
    func saveChecklistItems() {
        // 1 - the 'print' function is here for debugging purposes while working on the app.
        print("Saving checklist items")
        // 2 - This creates an instance of 'PropertyListEncoder', an object that takes the data stored in an object and encodes that data into a property list.
        let encoder = PropertyListEncoder()
        // 3 - We're calling methods that can result in failure or errors, which means that we need to put them in a 'do - catch' block.
        do {
            // 4 - Here, you call the encoder's 'encode()' method to encode the 'items' array.
            let data = try encoder.encode(items)
            // 5 - If the call to 'encode()' succeeds, 'data' now contains the contents of the 'items' array in encoded form.
            try data.write(to: dataFilePath(), options: Data.WritingOptions.atomic)
            // 6 - This is another 'print()' function for debugging purpose.
            print("Checklist items saved")
            // 7 - This is the start of the 'catch' block, which contains the code to execute if any line of code in the 'do' block threw and error.
        } catch {
            print("Error encoding item array: \(error.localizedDescription)")
        }
    }
    
    func loadChecklistItems() {
        // 1 - This 'print()' function is here for debugging purpose while working on the app.
        print("Loading checklist items")
        // 2 - First, you store the results of 'dataFilePath()' - the path to the 'Checklist.plist' file - in a temporary constant named 'path'.
        let path = dataFilePath()
        // 3 - The method tries to load the contents of 'Checklist.plist' into a new 'Data' object.
        if let data = try? Data(contentsOf: path) {
            // 4 - When the app does find a 'Checklist.plist' file the mothod creates an instance of 'PropertyListDecoder'
            let decoder = PropertyListDecoder()
            do {
                // 5 - The method loads the saved data back into 'items' using the decoder's 'decode' method.
                items = try decoder.decode([ChecklistItem].self, from: data)
                // 6 - This is another 'print()' function for debugging purpose.
                print("Checklist items loaded")
                // 7 - This is the start of the 'catch' block, which contains the code that executes if any line of code in the 'do' block throws an error.
            } catch {
                print("Error decoding item array: \(error.localizedDescription)")
            }
        }
    }
}
