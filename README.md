# SampleSwiftDataTransferrable


This is a self contained sample project demonstrating how to implement drag and drop functionality in SwiftUI with SwiftData `PersistentModel` objects using the **swiftdata-transferrable** Swift Package found at: [https://github.com/Whiffer/swiftdata-transferrable](https://github.com/Whiffer/swiftdata-transferrable)

## Using the SampleSwiftDataTransferrable project
- Build and run this project in the Xcode debugger.
- Tap the Toolbar + button to create one or more Items to drag.
- Select one or more Items from the List for dragging.
- Results of the drops will be printed in the debugging console.

### ItemsListView
- Drag the selected Item(s) above or below any Item in the List to allow reordering of the List (macOS only).
- Drag the selected Item(s) onto any Item in the List (macOS only).
### Target1View
- Drag one or more Items from the List to be dropped here (macOS and iOS).
- Does not show targeting. Always shows gray border whether targeted or not.
### Target2View
- Drag only one Item from the list to be dropped here (macOS and iOS).
- Shows a blue border when targeted.
