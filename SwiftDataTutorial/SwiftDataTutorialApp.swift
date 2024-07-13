import SwiftUI
import SwiftData

@main
struct SwiftDataTutorialApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        // データを永続化するコンテナを作成
        // パラメータとして型を渡す場合は、.selfという名前をつける。
        .modelContainer(for: DataItem.self)
    }
}
