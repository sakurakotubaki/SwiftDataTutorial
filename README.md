# SwiftData Tutorial
データスキーマを作成する。

```swift
import Foundation
import SwiftData

// データスキーマを定義
@Model
class DataItem: Identifiable {
    
    var id: String
    var name: String
    
    // 初期化する処理を書く
    init(name: String) {
        // uuidを文字列に初期化
        self.id = UUID().uuidString
        self.name = name
    }
}
```

- データを永続化するコンテナを作成
- パラメータとして型を渡す場合は、.selfという名前をつける。

```swift
import SwiftUI
import SwiftData

@main
struct SwiftDataTutorialApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: DataItem.self)
    }
}
```

これでデータを追加できるようになる。
```swift
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
```