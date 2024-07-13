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
