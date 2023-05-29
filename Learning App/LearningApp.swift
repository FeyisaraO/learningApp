//
//  Learning_AppApp.swift
//  Learning App
//
//  Created by Feyisara Odukoya on 29/05/2023.
//

import SwiftUI

@main
struct LearningApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}
