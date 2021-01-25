//
//  ContentView.swift
//  Bookworm
//
//  Created by Luis Alvarez on 1/19/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Book.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Book.title, ascending: true)]) var books:FetchedResults<Book>
    
    @State private var showAddScreen = false
    
    var body: some View {
        NavigationView{
            List{
                ForEach(books, id: \.self){ book in
                    NavigationLink(destination: DetailView(book: book)){
                        EmojiRatingView(rating: book.rating)
                            .font(.largeTitle)
                        
                        VStack(alignment: .leading) {
                            Text(book.title ?? "Unknown Title")
                                .font(.headline)
                                // Makes bad books have a red title
                                .foregroundColor(book.rating == 1 ? .red : .primary)
                            Text(book.author ?? "Unknown Author")
                                .foregroundColor(.secondary)
                        }
                    }
                }.onDelete(perform: deleteBooks)
            }
                .navigationBarTitle("Bookworm")
                .sheet(isPresented: $showAddScreen){
                    AddBookView().environment(\.managedObjectContext, self.moc)
                }
            .navigationBarItems(leading: EditButton(), trailing:
                    Button(action: {
                        showAddScreen.toggle()
                    }){
                        Image(systemName: "plus")
                    }
                )
        }
        
    }
    
    func deleteBooks(offsets: IndexSet){
        for num in offsets {
            let book = books[num]
            
            moc.delete(book)
        }
        try? moc.save()
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
