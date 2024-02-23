//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Martin Linklater on 21/02/2024.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}
