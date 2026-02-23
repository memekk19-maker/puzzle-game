import SwiftUI

struct ContentView: View {
    @StateObject private var store = EntryStore()
    @State private var inputText = ""

    private static let rowDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ja_JP")
        formatter.dateFormat = "yyyy/MM/dd"
        return formatter
    }()

    var body: some View {
        NavigationStack {
            VStack(spacing: 12) {
                // タイトル表示
                Text("ワンタップ日記")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top, 12)

                HStack {
                    TextField("今日のひとこと", text: $inputText)
                        .textFieldStyle(.roundedBorder)
                        .lineLimit(1)

                    Button("追加") {
                        store.add(text: inputText)
                        inputText = ""
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(inputText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                }
                .padding(.horizontal)

                List {
                    ForEach(store.sortedEntries) { entry in
                        Text("\(Self.rowDateFormatter.string(from: entry.date))  \(entry.text)")
                            .lineLimit(1)
                    }
                    .onDelete(perform: store.delete)
                }
            }
            .navigationTitle("")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
