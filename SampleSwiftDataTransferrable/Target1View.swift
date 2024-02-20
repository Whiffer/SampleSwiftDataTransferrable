//
//  Target1View.swift
//  SampleSwiftDataTransferrable
//
//  Created by Chuck Hartman on 10/19/23.
//

import SwiftUI

import SwiftDataTransferrable

struct Target1View: View {
    
    var body: some View {
        
        HStack {
            VStack(alignment: .leading) {
                Text("Drop one or more Items here.")
                Text("Does not show targeting. Always shows gray border whether targeted or not.")
           }
            Spacer()
        }
        .contentShape(Rectangle())
        .padding()
        .border(.gray, width: 1)
        .dropDestination(for: Item.self) { items, _ in
            for item in items {
                print("\(item.timestamp) dropped on Target 1")
            }
            return true
        }
    }
}

#Preview {
    Target2View()
}
