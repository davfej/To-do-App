//
//  RowView.swift
//  Checklist_SwiftUI
//
//  Created by Dávid Fejes on 2020. 08. 13..
//  Copyright © 2020. David Fejes. All rights reserved.
//

import SwiftUI

struct RowView: View {
    
    @Binding var checklistItem: ChecklistItem
    
    var body: some View {
        NavigationLink(destination: EditChecklistItemView(checklistItem: $checklistItem)) {
            HStack {
                Text(checklistItem.name)
                Spacer()
                Text(checklistItem.isChecked ? "✔️" : "")
            }
            .background(Color(UIColor.systemBackground))
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(checklistItem: .constant(ChecklistItem(name: "Sample item")))
    }
}
