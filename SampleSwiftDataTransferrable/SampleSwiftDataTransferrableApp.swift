//
//  SampleSwiftDataTransferrableApp.swift
//  SampleSwiftDataTransferrable
//
//  Created by Chuck Hartman on 10/19/23.
//

import SwiftUI
import SwiftData
import SwiftDataTransferrable

@main
struct SampleSwiftDataTransferrableApp: App {
    
    let schema = Schema([
        Item.self,
    ])

    var body: some Scene {
        SwiftDataTransferrableScene(schema: schema, exportedUTType: "com.YourTeam.persistentModelID") {
            WindowGroup {
                ContentView()
            }
        }
    }
}
