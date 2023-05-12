//
//  ContentView.swift
//  suitesting
//
//  Created by Blake Boris on 5/1/23.
//

import SwiftUI

struct Room {
    var name: String
    var lightsOn = false
}

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
