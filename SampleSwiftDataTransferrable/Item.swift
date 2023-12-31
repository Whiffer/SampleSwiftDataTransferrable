//
//  Item.swift
//  SampleSwiftDataTransferrable
//
//  Created by Chuck Hartman on 10/19/23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
