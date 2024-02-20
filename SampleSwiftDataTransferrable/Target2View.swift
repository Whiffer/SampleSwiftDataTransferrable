//
//  Target2View.swift
//  SampleSwiftDataTransferrable
//
//  Created by Chuck Hartman on 10/19/23.
//

import SwiftUI
import SwiftData

import SwiftDataTransferrable

struct Target2View: View {
    
    @State private var isTargeted = false
    
    var body: some View {
        
        HStack {
            VStack(alignment: .leading) {
                Text("Drop only one Item here.")
                Text("Shows a blue border when targeted.")
            }
            Spacer()
        }
        .contentShape(Rectangle())
        .padding()
        .border(.blue, width: (self.isTargeted ? 1 : 0))
        .dropDestination(for: Item.self) { items, _ in
            if items.count == 1 {
                for item in items {
                    print("\(item.timestamp) dropped on Target 2")
                }
                return true
            } else {
                return false
            }
        } isTargeted: { isTargeted in
            self.isTargeted = isTargeted
        }
    }
}

#Preview {
    Target1View()
}
