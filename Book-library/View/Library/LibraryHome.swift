//
//  LibraryHome.swift
//  Book-library
//
//  Created by Elizabeth Bricout on 2022-05-02.
//

import SwiftUI

struct LibraryHome: View {
	var booksInLibrary: [Book]
    var body: some View {
        BookGrid(booksInLibrary: booksInLibrary)
    }
}

#if DEBUG
struct LibraryHome_Previews: PreviewProvider {
    static var previews: some View {
        LibraryHome(booksInLibrary: Array(repeating: Book.example, count: 15))
    }
}
#endif
