//
//  ItemsListView.swift
//  SampleSwiftDataTransferrable
//
//  Created by Chuck Hartman on 10/19/23.
//

import SwiftUI
import SwiftData

import SwiftDataTransferrable

struct ItemsListView: View {
    
    @Query private var items: [Item]
    @State private var selection = Set<Item>()
    @State private var targetedItem: Item?
    @State private var dropProposal = DropProposal(operation: .copy)

    var body: some View {
        
        HStack {
            VStack(alignment: .leading) {
                Text("Tap the Toolbar + button above to create one or more Items to drag.")
                Text("Select one or more Items from the List for dragging.")
                Text("Drag the selected Item(s) to any Item in the List or one of the other targets below.")
#if os(macOS)
                Text("In macOS, when targeting an Item in the List, `DropOperation` defaults to `.move` or it will change to `.copy` if pressing the Option key.")
#endif
            }
            Spacer()
        }
        .padding()
        List(self.items, id: \.self, selection: $selection) { item in
            HStack {
                Text(item.timestamp.description)
                Spacer()
            }
            .opacity(item == targetedItem ? 0.5 : 1.0)
            .draggable(item)
            .dropDestination(for: Item.self) { draggedItems, _ in
                let targetItem = item   // for clarification
                for draggedItem in draggedItems {
                    print("\(draggedItem.timestamp) \(dropProposal.operation == .move ? "moved" : "copied") to: \(targetItem.timestamp)")
                }
                return true
            } isTargeted: { targeted in
                self.targetedItem = targeted ? item : nil
            } dropProposal: { _, _ in
#if os(macOS)
                let dropOperation = NSEvent.modifierFlags.contains(NSEvent.ModifierFlags.option) ? DropOperation.copy : DropOperation.move
#else
                let dropOperation = DropOperation.move
#endif
                self.dropProposal = DropProposal(operation: dropOperation)
                return self.dropProposal
            }
        }
    }
    
}

#Preview {
    ItemsListView()
}
