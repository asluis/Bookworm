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
    @FetchRequest(entity: Book.entity(), sortDescriptors: []) var books:FetchedResults<Book>
    
    @State private var showAddScreen = false
    
        
    
    
    var body: some View {
        NavigationView{
            
            Text("Count: \(books.count)")
            
            
            
                .navigationBarTitle("test")
                .sheet(isPresented: $showAddScreen){
                    AddBookView().environment(\.managedObjectContext, self.moc)
                }
                .navigationBarItems(trailing:
                    Button(action: {
                        showAddScreen.toggle()
                    }){
                        Image(systemName: "plus")
                    }
                )
        }
        
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
