# SampleSwiftDataTransferrable


This is a self contained sample project demonstrating how to implement drag and drop functionality in SwiftUI with SwiftData `PersistentModel` objects using the **swiftdata-transferrable** Swift Package found at: [https://github.com/Whiffer/swiftdata-transferrable](url)

## Using the SampleSwiftDataTransferrable project
- Build and run this project in the Xcode debugger.
- Tap the Toolbar + button above to create one or more Items to drag.
- Results of the drops will be printed in the debugging console.

### ItemsListView
- Select one or more Items from the List for dragging.
- Drag the selected Item(s) to any Item in the List or one of the other targets below.
- When targeting an Item in the List, `DropOperation` defaults to `.move` or it will change to `.copy` if pressing the Option key.
### Target1View
- Drop one or more Items here.
- The default `DropOperation` is `.copy`.
- Does not show targeting. Always shows gray border whether targeted or not.
### Target2View
- Drop only one Item here.
- Shows a blue border when targeted with a valid drop.
- `DropOperation` is `.copy` if dragging only one Item.
- `DropOperation` is `.forbidden` if dropping more than one Item.
