//
//  ContentView.swift
//  URLShortener
//
//  Created by Sarah Clark on 8/16/25.
//

import SwiftUI

struct ContentView: View {
    @State private var originalURL: String = ""
    @State private var shortURL: String = ""
    @State private var errorMessage: String = ""

    var body: some View {
        VStack(alignment: .leading) {
            Text("Original URL:")
                .padding(.leading, 10)

            HStack {
                TextField("Enter a URL here", text: $originalURL)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .disableAutocorrection(true)
                    .textInputAutocapitalization(.never)
                    .keyboardType(.URL)

                Button(action: { validate(name: originalURL) }, label: {
                    Text("Shorten URL")
                        .padding()
                        .foregroundStyle(.white)
                        .glassEffect(.regular.tint(.blue).interactive())
                })
            }
            .padding(10)
            .padding(.bottom, 50)

            if !errorMessage.isEmpty {
                Text(errorMessage)
                    .foregroundStyle(.red)
                    .padding()
            }

            HStack {
                Text("Short URL:")
                Text("\(shortURL)")
            }
            .padding(10)
        }
    }

     private func shortenURL() {
            guard let url = URL(string: "http://localhost:3000/shorten") else { return }
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")

            let body = ["originalURL": originalURL]
            request.httpBody = try? JSONSerialization.data(withJSONObject: body)

            URLSession.shared.dataTask(with: request) { data, _, error in
                DispatchQueue.main.async {
                    if let error = error {
                        errorMessage = "Error: \(error.localizedDescription)"
                        return
                    }

                    guard let data = data,
                          let json = try? JSONSerialization.jsonObject(with: data) as? [String: String],
                          let shortURL = json["shortURL"] else {
                        errorMessage = "Failed to parse response"
                        return
                    }

                    self.shortURL = shortURL
                    errorMessage = ""
                }
            }.resume()
        }

    private func validate(name: String) {
        if isValidURL(name) {
            shortenURL()
        } else {
            errorMessage = "Invalid URL. Please enter a valid one."
        }
    }

    private func isValidURL(_ urlString: String) -> Bool {
        guard let url = URL(string: urlString),
              let scheme = url.scheme?.lowercased(),
              (scheme == "http" || scheme == "https"),
              let host = url.host, !host.isEmpty else {
            return false
        }
        return true
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
