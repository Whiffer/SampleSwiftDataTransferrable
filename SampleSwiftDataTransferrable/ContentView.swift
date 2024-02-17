//
//  ContentView.swift
//  SampleSwiftDataTransferrable
//
//  Created by Chuck Hartman on 10/19/23.
//

import SwiftUI
import SwiftData

import SwiftDataTransferrable

struct ContentView: View {
    
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        
        NavigationStack {
            VStack {
                ItemsListView()
                Target1View()
                Target2View()
            }
            .toolbar {
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        }
    }
    
    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }
    
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
