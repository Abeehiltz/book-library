//
//  Book_libraryApp.swift
//  Book-library
//
//  Created by Elizabeth Bricout on 2022-04-30.
//

import SwiftUI

@main
struct Book_libraryApp: App {
	let persistenceController = PersistenceController.shared
	
	@Environment(\.scenePhase) var scenePhase
    var body: some Scene {
        WindowGroup {
			ContentView().environment(\.managedObjectContext, persistenceController.container.viewContext)
		}.onChange(of: scenePhase) { _ in persistenceController.save()}
    }
}
