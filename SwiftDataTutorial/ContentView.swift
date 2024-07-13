import SwiftUI
import SwiftData

struct ContentView: View {
    // このコンテキストを通じてすべての追加・更新・削除を実行できる
    @Environment(\.modelContext) private var context
    
    // all data fetch
    @Query private var items: [DataItem]
    
    var body: some View {
        VStack {
            
            Text("add data!")
            Button("Add an Item") {
                addItem()
            }
            // show array data
            List {
                ForEach(items) {item in
                    
                    HStack {
                        Text(item.name)
                        Spacer()
                        Button {
                            updateItem(item)
                        } label: {
                            Image(systemName: "arrow.triangle.2.circlepath")
                        }
                    }
                }.onDelete { indexes in
                    for index in indexes {
                        deleteItem(items[index])
                    }
                }
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
    
    // update
    func updateItem(_ item: DataItem) {
        // Edit the item data
        item.name = "updated Test Item"
        // Save the context
        try? context.save()
    }
    
    // delete
    func deleteItem(_ item: DataItem) {
        context.delete(item)
    }
}
