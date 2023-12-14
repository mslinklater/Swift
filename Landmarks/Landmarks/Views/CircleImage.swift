//
//  CircleImage.swift
//  Landmarks
//
//  Created by Martin Linklater on 12/12/2023.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("turtlerock")
            .clipShape(Circle())
            .overlay{
                Circle().stroke(.white, lineWidth: 3.0)
            }
            .shadow(radius: 7)
    }
}

#Preview {
    CircleImage()
}
