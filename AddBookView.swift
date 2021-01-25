//
//  AddBookView.swift
//  Bookworm
//
//  Created by Luis Alvarez on 1/22/21.
//

import SwiftUI

struct AddBookView: View {
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode

    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = ""
    @State private var review = ""
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Book Details")){
                    TextField("Title", text: $title)
                    TextField("Author", text: $author)
                    Picker("Genre", selection: $genre){
                        ForEach(genres, id: \.self){
                            Text("\($0)")
                        }
                    }
                }
                Section(header: Text("What did you think of it?")){
                    RatingView(rating: $rating)
                    
                    TextField("Review", text: $review)
                }
                Section{
                    Button("Save"){
                        let book = Book(context: self.moc)
                        book.title = self.title
                        book.author = self.author
                        book.rating = Int16(self.rating)
                        book.genre = self.genre
                        book.review = self.review
                        book.date = Date()
                        
                        
                        try? self.moc.save();
                        
                        self.presentationMode.wrappedValue.dismiss()
                    }.disabled(!self.isValidBook())
                    // We can only save a valid book w/ genre,title, and author
                }
            }
            .navigationBarTitle("Add Book")
        }
    }
    
    func isValidBook() -> Bool{
        if genre.isEmpty || title.isEmpty || author.isEmpty {
            return false
        }
        return true
    }
    
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
