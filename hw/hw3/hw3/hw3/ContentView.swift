//
//  ContentView.swift
//  hw3
//
//  Created by Blake Boris on 5/14/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List(Line.allCases) { line in
                NavigationLink(value: line) {
                    LineRow(line: line)
                }
            }
            .navigationTitle("Lines")
            .navigationDestination(for: Line.self) { line in
                LineView(line: line)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView();
        LineView(line: Line.red);
    }
}

struct LineRow: View {
    var line: Line
    
    var body: some View {
        HStack {
//            Image(line.type.rawValue)
            VStack(alignment: .leading) {
                Text(line.fullName).font(.title2)
                Text(line.serviceString).font(.subheadline).foregroundColor(.secondary)
            }
            Spacer()
        }
    }
}

struct LineView: View {
    var line: Line
    @State private var showIsADACompliant = true
    @State private var firstStopIndex: Double = 0.0
    private var stopsRange: Binding<ClosedRange<Double>> {
        Binding(
            get: {
                return firstStopIndex...Double(line.stops.count - 1)
            },
            set: { newValue in
                firstStopIndex = newValue.lowerBound
            }
        )
    }
    @State private var searchText = ""
    
    var body: some View {
        VStack {
            Toggle("Wheelchair Friendly?", isOn: $showIsADACompliant)
                .padding(.horizontal, 20)
            Slider(value: $firstStopIndex, in: 0...Double(line.stops.count - 1), step: 1)
                .padding(.horizontal, 20)
            TextField("Search", text: $searchText)
                .padding(8)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 20)
            List(line.stops.indices, id: \.self) { index in
                let stop = line.stops[index]
                
                if stopsRange.wrappedValue.contains(Double(index)) {
                    if searchText.isEmpty || stop.fullName.localizedCaseInsensitiveContains(searchText) {
                        NavigationLink(destination: Text(stop.fullName)) {
                            HStack {
                                Text(stop.fullName)
                                if showIsADACompliant && stop.isADACompliant {
                                    Image(systemName: "figure.roll")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 24, height: 24)
                                }
                                Spacer()
                            }
                        }
                    }
                }
            }
        }
    }
}

struct StopRow: View {
    var stop: Terminal
    
    var body: some View {
        HStack {
//            Image(line.type.rawValue)
            VStack(alignment: .leading) {
                Text(stop.fullName).font(.title2)
                Text(stop.coords).font(.subheadline).foregroundColor(.secondary)
            }
            Spacer()
        }
    }
}

struct StopView: View {
    var stop: Terminal
    
    var body: some View {
        Button(stop.shortName) {
            ()
        }
//        NavigationStack {
//            List(Terminal.allCases) { stop in
//                NavigationLink(value: stop) {
//                    StopRow(stop: stop)
//                }
//            }
//            .navigationTitle(stop.shortName)
//            .navigationDestination(for: Terminal.self) { stop in
//                StopView(line: line)
//            }
//        }
    }
}
