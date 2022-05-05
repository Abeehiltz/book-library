//
//  ViewBook.swift
//  Book-library
//
//  Created by Elizabeth Bricout on 2022-05-05.
//

import SwiftUI
import CachedAsyncImage

struct DescriptionViewBook: View {
	let description: String
	@Binding var showDescription: Bool
	
	var body: some View {
		NavigationView {
			ScrollView {
				Text(description).lineSpacing(6).padding(.horizontal, 15)
			}
			.navigationBarTitle(Text("Summary"), displayMode: .inline)
			.navigationBarItems(trailing: Button(action: {
				self.showDescription = false
			}) {
				Text("Close").bold()
			})
		}
	}
}

struct BookView: View {
	@ObservedObject var book: Book
	@State var showDescription = false
	
	var body: some View {
		ZStack {
			ScrollView {
				VStack {
					
					CachedAsyncImage(url: URL(string: book.thumbnail),
									 content: {image in image},
									 placeholder: {ProgressView()})
					Text(book.title).font(.title)
					Text("from: " + book.authors.joined(separator: ", "))
					StatusChip(bookStatus: book.bookStatus)
					Button(action: {
						self.showDescription.toggle()
					}) {
						Text("Show book summary")
					}.sheet(isPresented: $showDescription) {
						DescriptionViewBook(description: book.desc, showDescription: self.$showDescription)
					}
					Divider()
					Text("My personal review").italic().font(.title2)
					Text(book.review).lineSpacing(6).padding(.vertical, 2)
					
					
				}.padding()
			}
		}
		
	}
}

#if DEBUG
struct BookView_Previes: PreviewProvider {
	static var previews: some View {
		let book = Book(context: PersistenceController.preview.container.viewContext)
		book.title = titles[0]
		book.thumbnail = thumbnails[0]
		book.bookStatus = status[0]
		book.publisher = publisher[0]
		book.publishedDate = publishedDate[0]
		book.language = "en"
		book.isbn13 = isbn13s[0]
		book.isbn10 = isbn10s[0]
		book.desc = descriptions[0] + "This was a brilliant read. It's definitely character driven in the first half and them moves more into being plot driven. Usually, I find character driven stories somewhat boring unless they are written exceptionally well. This was written very well indeed, Varela's prose is almost lyric and it stands out as a character of its own in this novel. I was intrigued by the characters and their interactions. The dialogue, while simple, was perfect. It fit the characters like a second skin. I stayed up late into the night reading simply for the pleasure of the words and how Varela carved unique descriptions with them. I could feel the emotions as they poured off the page. I cared about the characters and I was with them through their journey. I am excited for the 2nd book in the series and would recommend this to anyone who enjoys fantasy adventure with two women as main characters."
		book.authors = ["Nina Varela", "Nina Varela"]
		book.review = "This was a brilliant read. It's definitely character driven in the first half and them moves more into being plot driven. Usually, I find character driven stories somewhat boring unless they are written exceptionally well. This was written very well indeed, Varela's prose is almost lyric and it stands out as a character of its own in this novel. I was intrigued by the characters and their interactions. The dialogue, while simple, was perfect. It fit the characters like a second skin. I stayed up late into the night reading simply for the pleasure of the words and how Varela carved unique descriptions with them. I could feel the emotions as they poured off the page. I cared about the characters and I was with them through their journey. I am excited for the 2nd book in the series and would recommend this to anyone who enjoys fantasy adventure with two women as main characters."
		
		return BookView(book: book)
	}
}
#endif

