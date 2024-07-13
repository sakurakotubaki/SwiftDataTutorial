import SwiftUI

struct ContentView: View {
    
    @Environment(\.modelContext) private var context
    
    var body: some View {
        VStack {
            
            Text("add data!")
            Button("Add an Item") {
                addItem()
            }
        }
        .padding()
    }
    
    func addItem() {
        // Create the item
        let item = DataItem(name: "Test Item")
        // Add the item to the data context
        context.insert(item)
    }
}

#Preview {
    ContentView()
}
