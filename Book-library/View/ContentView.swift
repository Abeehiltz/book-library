//
//  ContentView.swift
//  Book-library
//
//  Created by Elizabeth Bricout on 2022-05-02.
//

import SwiftUI

struct ContentView: View {
	
	@State private var selectedIndex: Int = 0
	@Namespace private var tabSelection
	@Environment(\.managedObjectContext) private var viewContext

	
	var body: some View {
		TabView (selection: $selectedIndex){
			LibraryHome().environment(\.managedObjectContext, viewContext)
				.tabItem {
					Image(systemName: "books.vertical")
					Text("Library")
				}
				.tag(0)
			
			Text("Search page incoming")
				.tabItem {
					Image(systemName: "magnifyingglass")
					Text("Search books")
				}
				.tag(1)
				
			
			Text("Setting page incoming")
				.tabItem {
					Image(systemName: "gear")
					Text("Settings")
				}
				
				.tag(2)
				
			
		}.accentColor(.pink)

			
	}
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
	}
}
#endif
