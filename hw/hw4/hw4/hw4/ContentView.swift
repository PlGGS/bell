//
//  ContentView.swift
//  hw4
//
//  Created by Blake Boris on 5/27/23.
//

import SwiftUI
import MapKit

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ContentView: View {
    @StateObject var location: Location = Location()
    
    var body: some View {
        NavigationView {
            List() {
                NavigationLink(destination: LabA().environmentObject(location)) {
                    LabRow(name: "A")
                }
                NavigationLink(destination: LabB().environmentObject(location)) {
                    LabRow(name: "B")
                }
                NavigationLink(destination: LabC().environmentObject(location)) {
                    LabRow(name: "C")
                }
            }
            .navigationTitle("Labs")
            .alert(isPresented: locationServicesUnavailable(), content: {
                switch location.authorizationStatus {
                    case .restricted:
                        return Alert(
                            title: Text("Location Services Restricted"),
                            message: Text("Location Services are restricted. This is most likely due to parental controls."),
                            primaryButton: .default(Text("Settings"), action: location.openSettings),
                            secondaryButton: .cancel()
                        )
                    case .denied:
                        return Alert(
                            title: Text("Location Services Denied"),
                            message: Text("Location Services were previously denied. Please enable Location Services in Settings."),
                            primaryButton: .default(Text("Settings"), action: location.openSettings),
                            secondaryButton: .cancel()
                        )
                    case .notDetermined:
                        return Alert(
                            title: Text("Location Services haven't been enabled yet"),
                            message: Text("How the hell did you get here???"),
                            primaryButton: .default(Text("Idk")),
                            secondaryButton: .cancel()
                        )
                    case .authorizedAlways, .authorizedWhenInUse:
                        return Alert(
                            title: Text("Location Services are actually Enabled"),
                            message: Text("How the hell did you get here???"),
                            primaryButton: .default(Text("Idk")),
                            secondaryButton: .cancel()
                        )
                    @unknown default:
                        return Alert(
                            title: Text("Location Services Disabled"),
                            message: Text("Please enable Location Services in Settings."),
                            primaryButton: .default(Text("Settings"), action: location.openSettings),
                            secondaryButton: .cancel()
                        )
                }
            })
        }
    }
    
    private func locationServicesUnavailable() -> Binding<Bool> {
        Binding<Bool>(
            get: {  location.manager == nil &&
                    location.authorizationStatus != .authorizedAlways &&
                    location.authorizationStatus != .authorizedWhenInUse
            },
            set: { _ in }
        )
    }
}

struct LabRow: View {
    var name: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(name).font(.title2)
            }
            Spacer()
        }
    }
}

struct LabA: View {
    @EnvironmentObject var location: Location
    
    var body: some View {
        VStack {
            Toggle("Location Services", isOn: $location.areLocationServicesEnabled)
            Toggle("Location Updates", isOn: $location.isUpdatingLocation)
            if let locationManager = location.manager {
                if let loc = locationManager.location {
                    Label(String("\(loc.coordinate.latitude), \(loc.coordinate.longitude)"), systemImage: "info.circle")
                        .padding(8)
                    VStack {
                        Picker("Location Accuracy", selection: $location.accuracy) {
                            ForEach(LocationAccuracy.allCases, id: \.self) { accuracy in
                                Text(accuracy.stringValue)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding(8)
                        HStack {
                            Text("Location Accuracy")
                            Spacer()
                            Text(LocationAccuracy.allCases[Int(location.accuracy.rawValue)].stringValue)
                        }
                        .padding(8)
                    }
                }
            }
        }
        .navigationBarTitle("Lab A")
        .padding(20)
        Spacer()
    }
}

struct LabB: View {
    @EnvironmentObject var location: Location
    
    var body: some View {
        VStack {
            
        }
        .navigationBarTitle("Lab B")
        .padding(20)
        Spacer()
    }
}

struct LabC: View {
    @EnvironmentObject var location: Location
    
    var body: some View {
        VStack {
            
        }
        .navigationBarTitle("Lab C")
        .padding(20)
        Spacer()
    }
}
