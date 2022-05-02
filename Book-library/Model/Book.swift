//
//  Book.swift
//  Book-library
//
//  Created by Elizabeth Bricout on 2022-05-01.
//

import Foundation

struct Book: Codable {
	
	var isbn10         : String
	var isbn13         : String
	
	var title          : String
	var authors        : [String]
	var description    : String
	
	var publishedDate  : Date?
	var publisher      : String
	
	var language       : String
	var googleBookLink : String
	var imageLinks     : ImageLinks
	
	var status     : BookStatus
	
	
	struct ImageLinks: Codable {
		var smallThumbnail: String
		var thumbnail: String
	}
	
	enum BookStatus: String, CaseIterable, Codable {
		case wishlist = "Wishlist"
		case yetToRead = "Yet to read"
		case finished = "Finished"
	}
	
}

#if DEBUG
// MARK: - Example Item
extension Book {
	
	static var example: Book {

		Book(
			
			isbn10: "0062823957",
			isbn13: "9780062823953",
			title: "Crier's War",
			authors: ["Nina Varela"],
			description: "From debut author Nina Varela comes the first book in an Own Voices, richly imagined epic fantasy duology about an impossible love between two girls--one human, one Made--whose romance could be the beginning of a revolution. Perfect for fans of Marie Rutkoski's The Winner's Curse as well as Game of Thrones and Westworld. After the War of Kinds ravaged the kingdom of Rabu, the Automae, designed to be the playthings of royals, usurped their owners' estates and bent the human race to their will. Now Ayla, a human servant rising in the ranks at the House of the Sovereign, dreams of avenging her family's death...by killing the sovereign's daughter, Lady Crier. Crier was Made to be beautiful, flawless, and to carry on her father's legacy. But that was before her betrothal to the enigmatic Scyre Kinok, before she discovered her father isn't the benevolent king she once admired, and most importantly, before she met Ayla. Now, with growing human unrest across the land, pressures from a foreign queen, and an evil new leader on the rise, Crier and Ayla find there may be only one path to love: war.",
			publishedDate: DateFormatter().date(from: "2020-08-11"),
			publisher: "Quill Tree Books",
			language: "en",
			googleBookLink: "https://www.googleapis.com/books/v1/volumes/cTrsywEACAAJ",
			imageLinks: ImageLinks(
				smallThumbnail: "https://books.google.com/books/content?id=cTrsywEACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api",
				thumbnail: "https://books.google.com/books/content?id=cTrsywEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api"
			),
			status: Book.BookStatus.finished
		)
	}
}
#endif
