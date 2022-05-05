//
//  StatusChip.swift
//  Book-library
//
//  Created by Elizabeth Bricout on 2022-05-05.
//

import SwiftUI

struct StatusChip: View {
	
	let bookStatus: BookStatus
	
	var statusToColor = [BookStatus.wishlist: Color.pink,
						BookStatus.yetToRead: Color.yellow,
						BookStatus.finished: Color.green]
	
    var body: some View {
		Text(bookStatus.rawValue)
			.padding()
			.lineLimit(1)
			.background(statusToColor[bookStatus])
			.frame(height: 34)
			.cornerRadius(20)
			
    }
}

struct StatusChip_Previews: PreviewProvider {
    static var previews: some View {
		StatusChip(bookStatus: BookStatus.wishlist)
    }
}
