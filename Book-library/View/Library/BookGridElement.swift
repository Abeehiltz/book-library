//
//  BookGridElement.swift
//  Book-library
//
//  Created by Elizabeth Bricout on 2022-05-02.
//

import SwiftUI
import CachedAsyncImage



struct BookGridElement: View {
	var book: Book
	
	
	
    var body: some View {
		VStack{
			CachedAsyncImage(url: URL(string: book.thumbnail),
							 content: {image in image.resizable().aspectRatio(contentMode: .fit)},
							 placeholder: {ProgressView()})
			Spacer()
			StatusChip(bookStatus: book.bookStatus)
			
		
		}
		.padding()
		.frame(width: 150, height: 250)
		.background(Color(red: 0.9, green: 0.9, blue: 0.9))
		.cornerRadius(10)
		
    }
}

#if DEBUG
struct BookGridElement_Previews: PreviewProvider {
	
	
    static var previews: some View {
		let book = Book(context: PersistenceController.preview.container.viewContext)
		book.title = "test Title"
		book.thumbnail = "https://books.google.com/books/content?id=cTrsywEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api"
		return BookGridElement(book: book)
			
    }
}
#endif

