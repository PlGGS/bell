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
        StopView(stop: Terminal.howardRedPurpleYellowlines)
    }
}

struct LineRow: View {
    var line: Line
    
    var body: some View {
        HStack {
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
                        NavigationLink(destination: StopView(stop: stop)) {
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
            .navigationTitle("Stops")
        }
    }
}

struct StopRow: View {
    var stop: Terminal
    
    var body: some View {
        HStack {
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
    
    @StateObject private var trdata = TerminalRequestData()
    
    var body: some View {
        Spacer()
        Spacer()
        Label("Select a train to be notified when it is approaching the station you selected.", systemImage: "info.circle")
        List(trdata.trains) { train in
            TrainButtonRow(train: train)
        }
        .navigationTitle(stop.shortName)
        .task {
            await trdata.getTerminalInfo(terminalID: stop.id)
        }
    }
}

struct TrainButtonRow: View {
    var train: Train
    
    @State private var showAlert = false
    private var lineName: String {
        Line(rawValue: train.lineName!)!.shortName
    }
    
    var body: some View {
        Button(action: {
            showAlert = true
        }) {
            HStack {
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "train.side.rear.car")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color(lineName))
                        Text("\(lineName) line run #\(train.runNumber!)").font(.title2).foregroundColor(Color.primary)
                    }
                    Text("\(train.getDirection())").font(.caption).foregroundColor(.secondary)
                }
                Spacer()
                TrainArrivalTime(train: train)
                    .alignmentGuide(HorizontalAlignment.trailing) { _ in 20 }
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("You'll be notified for \(lineName) line run #\(train.runNumber!)"),
                message: Text("Not really lol I'm lazyyyyyyyyyyyyy"),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

struct TrainArrivalTime: View {
    var train: Train
    
    private var lineName: String {
        Line(rawValue: train.lineName!)!.shortName
    }
    private var timeTillArrival: String {
        train.getTimeTillArrival()
    }
    
    var body: some View {
        VStack(alignment: .center) {
            if timeTillArrival != "Due" {
                Text(timeTillArrival).font(.title).foregroundColor(Color.primary)
                Text("minutes").font(.subheadline).foregroundColor(.secondary)
            }
            else {
                Text(timeTillArrival).font(.title).foregroundColor(Color.primary)
            }
        }
    }
}
