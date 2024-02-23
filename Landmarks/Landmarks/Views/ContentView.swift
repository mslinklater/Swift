//
//  ContentView.swift
//  Landmarks
//
//  Created by Martin Linklater on 21/02/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
