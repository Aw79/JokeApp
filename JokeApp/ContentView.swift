//
//  ContentView.swift
//  JokeApp
//
//  Created by Andreas Wörner on 18.10.26.
//

import SwiftUI
import JokeAPI

struct ContentView: View {
    private let jokeApi = JokeAPI()
    @State private var joke: Joke?
    @State private var error: JokeError?
    var body: some View {
        VStack(alignment: .center, spacing: 50) {
            Button("Load Joke...",
                   systemImage: "icloud.and.arrow.down") {
                Task {
                    do {
                        self.joke = try await jokeApi.loadJoke()
                    }
                    catch {
                        self.error = error as? JokeError
                    }
                }
            }
            if error != nil {
                Text(error?.debugDescription ?? "unknown").foregroundStyle(.red)
            } else {
                switch joke?.content {
                case .single(let singleJoke):
                    Text(singleJoke)
                case .twoPart(let setup, let delivery):
                    Text(setup)
                    Text(delivery)
                case nil:
                    Text("...")
                }
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
