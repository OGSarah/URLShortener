//
//  ContentView.swift
//  URLShortener
//
//  Created by Sarah Clark on 8/16/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Original URL:")
                TextField("Enter a URL here", text: .constant(""))
            }
            .padding(10)

            HStack {
                Text("Short URL:")
                Text("https://example.com")
            }
        }
        .padding()
    }
}

// MARK: - Previews
#Preview("Dark Mode") {
    ContentView()
    .preferredColorScheme(.dark)
}

#Preview("Light Mode") {
    ContentView()
        .preferredColorScheme(.light)
}
