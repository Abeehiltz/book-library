//
//  ContentView.swift
//  Book-library
//
//  Created by Elizabeth Bricout on 2022-05-02.
//

import SwiftUI
import BottomBar_SwiftUI

let itemsBar: [BottomBarItem] = [
	BottomBarItem(icon: "books.vertical", title: "Library", color: .pink),
	BottomBarItem(icon: "magnifyingglass", title: "Search books", color: .orange),
	BottomBarItem(icon: "gear", title: "Settings", color: .blue)
]

struct MainView: View {
	@Binding var selectedIndex: Int
	
	var body: some View {
		
		VStack {
		if (selectedIndex == 0) {
			LibraryHome(booksInLibrary: Array(repeating: Book.example, count: 15))
				.transition(.asymmetric(insertion: AnyTransition.move(edge: .bottom), removal: AnyTransition.move(edge: .top)))
		}
		
		if (selectedIndex == 1) {
			VStack {
			Spacer()
			Text("Search page incoming")
			Spacer()
			}.transition(.asymmetric(insertion: AnyTransition.move(edge: .bottom), removal: AnyTransition.move(edge: .top)))
		}
		
		
			
		if (selectedIndex == 2) {
			VStack {
			Spacer()
			Text("Setting page incoming")
			Spacer()
			}.transition(.asymmetric(insertion: AnyTransition.move(edge: .bottom), removal: AnyTransition.move(edge: .top)))
		}
		
		}.animation(.easeInOut, value: self.selectedIndex)
	}
}

struct ContentView: View {

	@State private var selectedIndex: Int = 0
	
    var body: some View {
		NavigationView {
			VStack {
				MainView(selectedIndex: $selectedIndex)
					.navigationBarHidden(true)
					

				Spacer()
				BottomBar(selectedIndex: $selectedIndex, items: itemsBar)
					
			}
		}
	}
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
