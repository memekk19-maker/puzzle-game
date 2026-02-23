import Foundation

/// UserDefaultsへの保存と復元を担当するストア。
@MainActor
final class EntryStore: ObservableObject {
    @Published private(set) var entries: [Entry] = []

    private let userDefaultsKey = "oneTapDiary.entries"

    init() {
        load()
    }

    var sortedEntries: [Entry] {
        entries.sorted { $0.date > $1.date }
    }

    func add(text: String) {
        let trimmed = text.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }

        let entry = Entry(id: UUID(), date: Date(), text: trimmed)
        entries.append(entry)
        save()
    }

    func delete(at offsets: IndexSet) {
        let sorted = sortedEntries
        let idsToDelete = offsets.map { sorted[$0].id }
        entries.removeAll { idsToDelete.contains($0.id) }
        save()
    }

    private func load() {
        guard let data = UserDefaults.standard.data(forKey: userDefaultsKey) else {
            entries = []
            return
        }

        do {
            let decoder = JSONDecoder()
            entries = try decoder.decode([Entry].self, from: data)
        } catch {
            // 復元に失敗したら空配列で開始（クラッシュ回避）。
            entries = []
        }
    }

    private func save() {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(entries)
            UserDefaults.standard.set(data, forKey: userDefaultsKey)
        } catch {
            // 保存失敗時は既存データを維持する。
        }
    }
}
