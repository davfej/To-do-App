//
//  ChecklistItem.swift
//  Checklist_SwiftUI
//
//  Created by Dávid Fejes on 2020. 08. 11..
//  Copyright © 2020. David Fejes. All rights reserved.
//

import Foundation

struct ChecklistItem: Identifiable {
    let id = UUID() // 'UUID' is a built-in struct which generates a universally unique value every time it's called.
    var name: String
    var isChecked: Bool = false
}
