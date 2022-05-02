//
//  BookGrid.swift
//  Book-library
//
//  Created by Elizabeth Bricout on 2022-05-02.
//

import SwiftUI

struct BookGrid: View {
	var booksInLibrary: [Book]
	var vGridLayout = [ GridItem(.adaptive(minimum: 150))]
	
    var body: some View {
		ScrollView {
			LazyVGrid(columns: vGridLayout) {
				ForEach(0..<14) {row in BookGridElement(book: booksInLibrary[row])}
			}.padding(.all, 20)
		}
    }
}

#if DEBUG
struct BookGrid_Previews: PreviewProvider {
    static var previews: some View {
		BookGrid(booksInLibrary: Array(repeating: Book.example, count: 15))
    }
}
#endif

