//
//  BookGridElement.swift
//  Book-library
//
//  Created by Elizabeth Bricout on 2022-05-02.
//

import SwiftUI
import CachedAsyncImage

var statusToColor = [BookStatus.wishlist: Color.pink,
					BookStatus.yetToRead: Color.yellow,
					BookStatus.finished: Color.green]
struct BookGridElement: View {
	var book: Book
	
	var Chip: some View {
		Text(book.bookStatus.rawValue)
			.padding()
			.lineLimit(1)
			.background(statusToColor[book.bookStatus])
			.frame(height: 34)
			.cornerRadius(20)
			.overlay(Capsule().stroke(Color.yellow, lineWidth: 1))
	}
	
    var body: some View {
		VStack{
			CachedAsyncImage(url: URL(string: book.thumbnail),
							 content: {image in image.resizable().aspectRatio(contentMode: .fit)},
							 placeholder: {ProgressView()})
			Spacer()
			Chip
			
		
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
		var book = Book(context: PersistenceController.preview.container.viewContext)
		book.title = "test Title"
		book.thumbnail = "https://books.google.com/books/content?id=cTrsywEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api"
		return BookGridElement(book: book)
			
    }
}
#endif

