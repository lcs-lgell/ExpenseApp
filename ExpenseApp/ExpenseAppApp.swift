//
//  ExpenseAppApp.swift
//  ExpenseApp
//
//  Created by Leon Gell on 2023-06-01.
//

import SwiftUI

@main
struct ExpenseAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
            // make the database viewable in every view
                .environment(\.blackbirdDatabase, AppDatabase.instance)
        }
    }
}
