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
    
    var body: some View {
        
        HStack {
            VStack(alignment: .leading) {
                Text("Tap the Toolbar + button above to create one or more Items to drag.")
                Text("Select one or more Items from the List for dragging.")
                Text("Results of the drops will be printed in the debugging console.")
                Text("Drag the selected Item(s) onto one of the two targets below the List (macOS and iOS).")
                Text("Drag the selected Item(s) above or below any Item in the List to allow reordering of the List (macOS only and iOS).")
                Text("Drag the selected Item(s) onto any Item in the List (macOS only).")
            }
            Spacer()
        }
        .padding()
        List(selection: $selection) {
            ForEach(self.items, id: \.self) { item in
                HStack {
                    Text(item.timestamp.description)
                    Spacer()
                }
                .contentShape(Rectangle())
                .opacity(item == targetedItem ? 0.5 : 1.0)
                .draggable(item)
                .dropDestination(for: Item.self) { droppedItems, _ in
                    if droppedItems.count == 1 {
                        for droppedItem in droppedItems {
                            print("\(droppedItem.timestamp) dropped on List Row \(item.timestamp)")
                        }
                        return true
                    } else {
                        return false
                    }
                } isTargeted: { isTargeted in
                    self.targetedItem = isTargeted ? item : nil
                }
            }
#if os(iOS)
            .onMove(perform: onMove )   // If this View Modifier is present in macOS, attempts to reorder the list will fail.
#endif
#if os(macOS)
            .dropDestination(for: Item.self) { items, offset in
                for item in items {
                    print("\(item.timestamp) inserted at: \(offset)")
                }
            }
#endif
        }
    }
    
#if os(iOS)
    private func onMove(indexSet: IndexSet, to: Int) {
        for index in indexSet {
            print("\(self.items[index].timestamp) moved to: \(to)")
        }
    }
#endif

}

#Preview {
    ItemsListView()
}
