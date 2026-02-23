import Foundation

/// 日記の1件分を表すデータモデル。
struct Entry: Identifiable, Codable, Equatable {
    let id: UUID
    let date: Date
    let text: String
}
