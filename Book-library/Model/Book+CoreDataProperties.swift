//
//  Book+CoreDataProperties.swift
//  Book-library
//
//  Created by Elizabeth Bricout on 2022-05-03.
//
//

import Foundation
import CoreData


extension Book {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Book> {
        return NSFetchRequest<Book>(entityName: "Book")
    }

    @NSManaged public var isbn10: String
    @NSManaged public var isbn13: String
    @NSManaged public var title: String
    @NSManaged public var authors: [String]
    @NSManaged public var desc: String
    @NSManaged public var publishedDate: Date?
    @NSManaged public var publisher: String
    @NSManaged public var language: String
    @NSManaged public var thumbnail: String
    @NSManaged private var status: String
	
	var bookStatus: BookStatus {
		set {
			status = newValue.rawValue
		}
		get {
			BookStatus(rawValue: status) ?? .wishlist
		}
	}

}

extension Book : Identifiable {

}
enum BookStatus: String, CaseIterable, Codable {
	case wishlist = "Wishlist"
	case yetToRead = "Yet to read"
	case finished = "Finished"
}
