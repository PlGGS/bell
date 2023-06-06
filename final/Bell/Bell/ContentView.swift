//
//  ContentView.swift
//  Bell
//
//  Created by Blake Boris on 5/31/23.
//

import SwiftUI
import MapKit

//https://stackoverflow.com/questions/56491386/how-to-hide-keyboard-when-using-swiftui
extension UIApplication {
    ///Hides the keyboard
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct ContentView: View {
    @State private var isKeyboardVisible: Bool = false
    @StateObject var mapViewModel = MapViewModel()
    @State private var isCenterCloseToUserLocation = false
    @State private var userPinLatitude: Double = 0.0
    @State private var userPinLongitude: Double = 0.0
    
    let initialSheetHeightOffset: CGFloat = UIScreen.main.bounds.height * 0.48;
    let sheetGrabOffset: Double = 0.18;
    let sheetHideHeight: Double = UIScreen.main.bounds.height * 0.81;
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .bottomLeading) {
                MapView()
                    .onTapGesture {
                        UIApplication.shared.endEditing()
                        
                        if mapViewModel.sheetHeightOffset < initialSheetHeightOffset {
                            mapViewModel.sheetHeightOffset = initialSheetHeightOffset
                        }
                    }
                    .environmentObject(mapViewModel)
                    .edgesIgnoringSafeArea(.all)
                    .alert(isPresented: locationServicesUnavailable(), content: {
                        Alert(
                            title: Text("Location Services Disabled"),
                            message: Text("Please enable Location Services in Settings."),
                            primaryButton: .default(Text("Settings"), action: mapViewModel.location.openSettings),
                            secondaryButton: .cancel()
                        )
                    })
                VStack {
                    CustomSheetView(initialSheetHeightOffset: initialSheetHeightOffset, sheetHideHeight: sheetHideHeight, isKeyboardVisible: $isKeyboardVisible)
                        .environmentObject(mapViewModel)
                        .transition(.move(edge: .bottom))
                        .animation(.easeInOut)
                        .offset(y: mapViewModel.sheetHeightOffset)
                        .gesture(
                            DragGesture(coordinateSpace: .local)
                                .onChanged { value in
                                    UIApplication.shared.endEditing()
                                    if value.location.y >= geo.size.height * sheetGrabOffset {
                                        mapViewModel.sheetHeightOffset = value.location.y - geo.size.height * sheetGrabOffset
                                    }
                                }
                                .onEnded { value in
                                    if value.location.y > sheetHideHeight {
                                        mapViewModel.sheetHeightOffset = sheetHideHeight
                                    }
                                }
                        )
                }
                
            }
            .edgesIgnoringSafeArea(.bottom)
            .onAppear {
                mapViewModel.sheetHeightOffset = initialSheetHeightOffset
            }
        }
    }
    
    private func locationServicesUnavailable() -> Binding<Bool> {
        Binding<Bool>(
            get: { mapViewModel.location.manager == nil },
            set: { _ in }
        )
    }
}

struct CustomSheetView: View {
    var initialSheetHeightOffset: CGFloat
    var sheetHideHeight: CGFloat
    @Binding var isKeyboardVisible: Bool
    
    @EnvironmentObject var mapViewModel: MapViewModel
    
    @State private var presentSettingsView = false
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Button(action: {
                    mapViewModel.recenterMap()
                    
                    if mapViewModel.selectedTerminal == nil {
                        mapViewModel.recenterDotAnnotation()
                    }
                }) {
                    if mapViewModel.isCenterCloseToUserLocation {
                        CircleButtonView(systemImageName: "location.fill")
                    }
                    else {
                        CircleButtonView(systemImageName: "location")
                    }
                }
                .background(Color.blue)
                .clipShape(Circle())
                .padding(20)
                Spacer()
                Button(action: {
                    if mapViewModel.sheetHeightOffset < sheetHideHeight {
                        //if the sheet isn't being hidden, we navigate to the settings page
                        presentSettingsView.toggle()
                    }
                    else {
                        //otherwise, we simply move the sheet back up
                        mapViewModel.sheetHeightOffset = initialSheetHeightOffset
                    }
                }) {
                    if mapViewModel.sheetHeightOffset < sheetHideHeight {
                        //if the sheet isn't being hidden, we show the settings icon
                        CircleButtonView(systemImageName: "gear")
                    }
                    else {
                        //otherwise, we show an up arrow
                        CircleButtonView(systemImageName: "arrow.up.circle")
                    }
                }
                .popover(isPresented: $presentSettingsView, arrowEdge: .top) {
                    SettingsView()
                        .environmentObject(mapViewModel)
                }
                .background(Color.blue)
                .clipShape(Circle())
                .padding(20)
            }
            
            VStack {
                RoundedRectangle(cornerRadius: 2)
                    .fill(.gray)
                    .frame(width: 50, height: 5)
                    .padding(.top)
                NearbyListView(initialSheetHeightOffset: initialSheetHeightOffset, isKeyboardVisible: $isKeyboardVisible)
                    .environmentObject(mapViewModel)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(UIColor.systemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 15))
        }
    }
}

struct SettingsView: View {
    @EnvironmentObject var mapViewModel: MapViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                Toggle("Only show accessible stops", isOn: $mapViewModel.onlyShowAccessibleStops)
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                Toggle("Limit search bar to filter nearby stops", isOn: $mapViewModel.searchBarFiltersNearbyStops)
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                VStack {
                    Slider(value: $mapViewModel.userRadialRegionRadius, in: 0.25...10.0, step: 0.05) {
                        
                    }
                    HStack {
                        Text("Nearby stops radius")
                        Spacer()
                        Text("\(String(format: "%.2f", mapViewModel.userRadialRegionRadius)) Miles")
                    }
                }
                .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                
                Spacer()
            }
            .navigationBarTitle("Settings")
        }
    }
}

struct CircleButtonView: View {
    var systemImageName: String
    
    var body: some View {
        Image(systemName: systemImageName)
            .font(.system(size: 24))
            .foregroundColor(.white)
            .padding()
            .background(Circle())
    }
}

struct NearbyListView: View {
    var initialSheetHeightOffset: CGFloat
    
    @Binding var isKeyboardVisible: Bool
    
    @State private var stops: [Terminal] = []
    @State private var firstStopIndex: Double = 0.0
    @State private var scrollOffset: CGFloat = 0.0
    
    @EnvironmentObject var mapViewModel: MapViewModel
    
    var userRadialRegion: RadialRegion {
        //Only use the current user pin location if the user hasn't selected a stop yet
        if mapViewModel.selectedTerminal == nil {
            return RadialRegion(latitude: mapViewModel.view.region.center.latitude, longitude: mapViewModel.view.region.center.longitude, radiusInMiles: mapViewModel.userRadialRegionRadius)
        }
        else {
            return RadialRegion(latitude: mapViewModel.userPinLocationWhenTerminalSelected.latitude, longitude: mapViewModel.userPinLocationWhenTerminalSelected.longitude, radiusInMiles: mapViewModel.userRadialRegionRadius)
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Line or destination", text: $mapViewModel.searchText)
                    .padding(8)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal, 20)
                    .onTapGesture {
                        mapViewModel.sheetHeightOffset = 0
                        isKeyboardVisible = true
                    }
                ScrollViewReader { scrollViewProxy in
                    List(mapViewModel.searchStops, id: \.self) { stop in
                        if mapViewModel.searchText.isEmpty ||
                            stop.fullName.localizedCaseInsensitiveContains(mapViewModel.searchText) ||
                            stop.lines.contains(where: { line in
                                return line.shortName.localizedCaseInsensitiveContains(mapViewModel.searchText)
                            }) {
                            if mapViewModel.onlyShowAccessibleStops && stop.isADACompliant ||
                                mapViewModel.onlyShowAccessibleStops == false {
                                StopRow(stop: stop)
                            }
                        }
                    }
                    .overlay(
                        GeometryReader { geometry in
                            Color.clear
                                .onChange(of: scrollOffset) { _ in
                                    scrollViewProxy.scrollTo(scrollOffset, anchor: .top)
                                    isKeyboardVisible = true
                                }
                        }
                    )
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                scrollOffset -= value.translation.height
                                UIApplication.shared.endEditing()
                            }
                    )
                }
            }
            .onReceive(NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification)) { text in
                if mapViewModel.searchText.isEmpty || mapViewModel.searchBarFiltersNearbyStops {
                    mapViewModel.searchStops = userRadialRegion.getTerminals()
                }
                else {
                    mapViewModel.searchStops = Terminal.allCases
                }
            }
        }
    }
}

struct StopRow: View {
    var stop: Terminal
    
    @EnvironmentObject var mapViewModel: MapViewModel
    
    var body: some View {
        NavigationLink(destination: StopView(stop: stop).environmentObject(mapViewModel)) {
            HStack {
                Text(stop.fullName)
                    .listRowBackground(Color.clear)
                if stop.isADACompliant {
                    Image(systemName: "figure.roll")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                        .background(Color.clear)
                }
                Spacer()
            }
        }
    }
}

struct StopView: View {
    var stop: Terminal
    
    @StateObject private var trdata: TerminalDataFetcher = TerminalDataFetcher()
    @State private var terminalInfoString: String = "";
    
    @EnvironmentObject var mapViewModel: MapViewModel
    
    var body: some View {
        VStack {
            if trdata.trains.isEmpty {
                if terminalInfoString != "" {
                    Text(terminalInfoString)
                }
                else {
                    Text("No terminal information available.")
                }
            } else {
                List(trdata.trains) { train in
                    TrainButtonRow(train: train)
                        .environmentObject(mapViewModel)
                }
            }
        }
        .onAppear {
            mapViewModel.isSelectingTerminal = false
            mapViewModel.selectedTerminal = stop
            
            //only force unwrapping selectedTerminal because we just set it above
            mapViewModel.drawTransitLines(mapViewModel.selectedTerminal!.lines)
        }
        .onDisappear {
            mapViewModel.removeTrainAnnotations()
            
            mapViewModel.isSelectingTerminal = true
            
            mapViewModel.drawTransitLines(Line.allCases)
        }
        .navigationTitle(stop.shortName)
        .task {
            let infoString = await trdata.getTerminalInfo(terminalID: stop.rawValue)
            self.terminalInfoString = infoString ?? ""
        }
    }
}

struct TrainButtonRow: View {
    var train: Train
    
    @StateObject private var trdata: TrainDataFetcher = TrainDataFetcher()
    
    private var lineName: String {
        Line(rawValue: train.lineName!)!.shortName
    }
    
    @EnvironmentObject var mapViewModel: MapViewModel
    
    var body: some View {
        Button(action: {
            if let annotation = train.annotation {
                let trainLocation = CLLocationCoordinate2D(latitude: annotation.coordinate.latitude, longitude: annotation.coordinate.longitude)
                
//                print("\(lineName) line run #\(train.runNumber!) started out at \(train.latitude!), \(train.longitude!)")
                
                mapViewModel.placeDotAnnotation(trainLocation)
                mapViewModel.moveMap(to: trainLocation)
            }
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
        .task {
            if let closestEta = await trdata.getClosestTerminal(train: train) {
                let id = Int(closestEta.nextParentTerminalID ?? "?????") ?? 0
                train.nextTerminal = Terminal(rawValue: id)
                
                train.annotation = mapViewModel.createTrainAnnotation(train: train)
                mapViewModel.placeTrainAnnotation(train: train)
                
//                print("\(train.lineName!) line run #\(train.runNumber!) says it started at \(train.latitude ?? "the station"), \(train.longitude ?? "the station")")
                
                if let annotation = train.annotation {
                    DispatchQueue.main.async {
                        @MainActor func performMoveCoordinate() {
                            if let nextTerminal = annotation.nextTerminal {
                                annotation.moveCoordinate(towards: CLLocationCoordinate2D(latitude: nextTerminal.latitude, longitude: nextTerminal.longitude))

                                let delay: TimeInterval = 0.008333333 // 83.3333 milliseconds (120 times per second)
                                DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                                    performMoveCoordinate()
                                }
                            }
                        }

                        performMoveCoordinate()
                    }
                }
            }
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
