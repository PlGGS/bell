//
//  ContentView.swift
//  hw4
//
//  Created by Blake Boris on 5/27/23.
//

import SwiftUI

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List() {
//                NavigationLink() {
                    LineRow()
//                }s
            }
            .navigationTitle("Lines")
//            .navigationDestination(for: Line.self) { line in
//                LineRow()
//            }
        }
    }
}

struct LineRow: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Hey").font(.title2)
//                Text(line.serviceString).font(.subheadline).foregroundColor(.secondary)
            }
            Spacer()
        }
    }
}
