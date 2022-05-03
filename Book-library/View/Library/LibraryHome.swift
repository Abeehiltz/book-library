//
//  LibraryHome.swift
//  Book-library
//
//  Created by Elizabeth Bricout on 2022-05-02.
//

import SwiftUI

struct LibraryHome: View {
    var body: some View {
        BookGrid()
    }
}

#if DEBUG
struct LibraryHome_Previews: PreviewProvider {
    static var previews: some View {
		LibraryHome().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
#endif
