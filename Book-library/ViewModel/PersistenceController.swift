//
//  Persistence.swift
//  Book-library
//
//  Created by Elizabeth Bricout on 2022-05-03.
//

import CoreData

let titles = ["Crier's war", "Wandering Witch: The Journey of Elaina, Vol. 1 (light novel)", "She Drives Me Crazy"]
let thumbnails = ["https://books.google.com/books/content?id=cTrsywEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api", "https://books.google.com/books/content?id=vPoByAEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api", "https://books.google.com/books/content?id=yDYtEAAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api"
	]
let status: [BookStatus] = [BookStatus.finished, BookStatus.yetToRead, BookStatus.wishlist]
let publisher = ["Quill Tree Books", "Yen On", "none"]
let publishedDate: [Date?] = [DateFormatter().date(from: "2020-08-11"), DateFormatter().date(from: "2020-01-28"), DateFormatter().date(from: "2022-04-19")]
let isbn13s = ["9780062823953", "9781975332952", "9781250821126"]
let isbn10s = ["0062823957", "1975332954", "1250821126"]
let descriptions = ["From debut author Nina Varela comes the first book in an Own Voices, richly imagined epic fantasy duology about an impossible love between two girls--one human, one Made--whose romance could be the beginning of a revolution. Perfect for fans of Marie Rutkoski's The Winner's Curse as well as Game of Thrones and Westworld. After the War of Kinds ravaged the kingdom of Rabu, the Automae, designed to be the playthings of royals, usurped their owners' estates and bent the human race to their will. Now Ayla, a human servant rising in the ranks at the House of the Sovereign, dreams of avenging her family's death...by killing the sovereign's daughter, Lady Crier. Crier was Made to be beautiful, flawless, and to carry on her father's legacy. But that was before her betrothal to the enigmatic Scyre Kinok, before she discovered her father isn't the benevolent king she once admired, and most importantly, before she met Ayla. Now, with growing human unrest across the land, pressures from a foreign queen, and an evil new leader on the rise, Crier and Ayla find there may be only one path to love: war.", "Once upon a time, there was a witch named Elaina, who set off on a journey across the world. Along the way, she would meet all kinds of people, from a country full of witches to a giant in love with his own muscles-but with each meeting, Elaina would become a small part of their story, and her own world would get a little bit bigger.", "High school nemeses fall in love in this queer YA rom com by the author of Late to the Party."]
let authors = [["Nina Varela"],["Jougi Shiraishi"], ["Kelly Quindlen"] ]

struct PersistenceController {
	// A singleton for our entire app to use
	static let shared = PersistenceController()
	
	// Storage for Core Data
	let container: NSPersistentContainer
	
	// A test configuration for SwiftUI previews
	static var preview: PersistenceController = {
		let controller = PersistenceController(inMemory: true)
		
		// Create 3 example books
		for i in 0..<3 {
			print(i)
			let book = Book(context: controller.container.viewContext)
			book.title = titles[i]
			book.thumbnail = thumbnails[i]
			book.bookStatus = status[i]
			book.publisher = publisher[i]
			book.publishedDate = publishedDate[i]
			book.language = "en"
			book.isbn13 = isbn13s[i]
			book.isbn10 = isbn10s[i]
			book.desc = descriptions[i]
			book.authors = authors[i]
			book.review = "A very nice book"
		}
		
		return controller
	}()
	
	init(inMemory: Bool = false) {
		container = NSPersistentContainer(name: "BookLibrary")
		
		if inMemory {
			container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
		}
		
		container.loadPersistentStores { description, error in
			if let error = error {
				fatalError("Error \(error.localizedDescription)")
			}
			
		}
	}
	
	func save() {
		let context = container.viewContext
		
		if context.hasChanges {
			do {
				try context.save()
			} catch {
				// Show some error here 
			}
		}
	}
}
