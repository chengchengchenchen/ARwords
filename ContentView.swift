////
////  ContentView.swift
////  Backend
////
////  Created by Ihsiao Huang on 2023/6/9.
////
//
//import SwiftUI
//import CoreData
//
//
//
//
//struct ContentView: View {
//    // Create some example words
//    let words = [
//        WordP(english: "Hello", chinese: "你好"),
//        WordP(english: "Thank you", chinese: "谢谢"),
//        WordP(english: "Goodbye", chinese: "再见"),
//        WordP(english: "Yes", chinese: "是"),
//        WordP(english: "No", chinese: "不是")
//    ]
//    
//    // Create a word manager with a batch size of 3
//    @State var wordManager = WordManager(words: words, batchSize: 3)
//    
//    var body: some View {
//        List {
//            ForEach(wordManager.getBatch(), id: \.self) { word in
//                HStack {
//                    Text(word.english)
//                    Spacer()
//                    Text(word.chinese)
//                }
//            }
//            .onDelete(perform: deleteWord)
//        }
//    }
//    
//    func deleteWord(at offsets: IndexSet) {
//        // Get the index of the word to delete
//        if let index = offsets.first {
//            // Call the memorized function on the word manager
//            wordManager.memorized(wordIndex: index)
//            
//            // Update the view
//            wordManager = WordManager(words: words, batchSize: 3)
//        }
//    }
//}

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \WordBookP.name, ascending: true)],
        animation: .default)
    private var wordBooks: FetchedResults<WordBookP>

    var body: some View {
        NavigationView {
            List {
                if wordBooks.isEmpty {
                    Text("No word books")
                } else {
                    ForEach(wordBooks) { wordBook in
                        NavigationLink(destination: WordBookDetailView(wordBook: wordBook)) {
                            Text(wordBook.name ?? "Unknown")
                        }
                    }
                    .onDelete(perform: deleteWordBooks)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addWordBook) {
                        Label("Add Word Book", systemImage: "plus")
                    }
                }
            }
            .navigationTitle("Word Books")
        }
    }

    private func addWordBook() {
        withAnimation {
            let newWordBook = WordBookP(context: viewContext)
            newWordBook.name = "New Word Book"
            newWordBook.id = UUID()

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteWordBooks(offsets: IndexSet) {
        withAnimation {
            offsets.map { wordBooks[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

struct WordBookDetailView: View {
    @ObservedObject var wordBook: WordBookP

    var body: some View {
        VStack {
            TextField("Name", text: Binding($wordBook.name)!)
            ForEach(wordBook.containsArray, id: \.self) { word in
                HStack {
                    Text(word.english ?? "Unknown")
                    Spacer()
                    Text(word.chinese ?? "Unknown")
                }
            }
        }
        .navigationTitle(wordBook.name ?? "Unknown")
    }
}

extension WordBookP {
    var containsArray: [WordP] {
        let set = contains as? Set<WordP> ?? []
        return set.sorted { $0.english! < $1.english! }
    }
}
