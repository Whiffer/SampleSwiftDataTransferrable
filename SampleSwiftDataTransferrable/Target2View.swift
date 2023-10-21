//
//  Target2View.swift
//  SampleSwiftDataTransferrable
//
//  Created by Chuck Hartman on 10/19/23.
//

import SwiftUI

import SwiftDataTransferrable

struct Target2View: View {
    
    @State private var isTargeted = false
    
    var body: some View {
        
        HStack {
            VStack(alignment: .leading) {
                Text("Drop only one Item here.")
                Text("Shows a blue border when targeted with a valid drop.")
                Text("`DropOperation` is `.copy` if dragging only one Item.")
                Text("`DropOperation` is `.forbidden` if dropping more than one Item.")
            }
            Spacer()
        }
        .padding()
        .border(.blue, width: (self.isTargeted ? 1 : 0))
        .dropDestination(for: Item.self) { items, _ in
            if let item = items.first {
                print("\(item.timestamp) dropped on Target 2")
                return true
            } else {
                return false
            }
        } isTargeted: { targeted in
            self.isTargeted = targeted
        } dropProposal: { items, _ in
            // DropProposal operation will be .forbidden if dragging more than one Item
            if items.count > 1 {
                self.isTargeted = false
                return DropProposal(operation: DropOperation.forbidden)
            }
            return DropProposal(operation: DropOperation.copy)
        }
    }
}

#Preview {
    Target1View()
}
