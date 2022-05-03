//
//  BookGrid.swift
//  Book-library
//
//  Created by Elizabeth Bricout on 2022-05-02.
//

import SwiftUI

struct BookGrid: View {
	
	@Environment(\.managedObjectContext) private var viewContext
	@FetchRequest(entity: Book.entity(), sortDescriptors: [])
		var booksInLibrary: FetchedResults<Book>
	
	var vGridLayout = [ GridItem(.adaptive(minimum: 150))]
	
    var body: some View {
		ScrollView {
			LazyVGrid(columns: vGridLayout) {
				ForEach(booksInLibrary, id: \.isbn10) {book in BookGridElement(book: book)}
			}.padding(.all, 20)
		}
    }
}

#if DEBUG
struct BookGrid_Previews: PreviewProvider {
    static var previews: some View {
		BookGrid().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
#endif

