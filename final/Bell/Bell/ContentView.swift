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
    @State private var sheetHeightOffset: CGFloat = 0
    @State private var isKeyboardVisible: Bool = false
    @StateObject var mapViewModel = MapViewModel()
    @State private var isCenterCloseToUserLocation = false
    @State private var userPinLatitude: Double = 0.0
    @State private var userPinLongitude: Double = 0.0
    
    let initialSheetHeightOffset: CGFloat = UIScreen.main.bounds.height * 0.4;
    let sheetGrabOffset: Double = 0.18;
    let sheetHideHeight: Double = UIScreen.main.bounds.height * 0.8;
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .bottomLeading) {
                MapView()
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
                    CustomSheetView(initialSheetHeightOffset: initialSheetHeightOffset, sheetHideHeight: sheetHideHeight, sheetHeightOffset: $sheetHeightOffset, isKeyboardVisible: $isKeyboardVisible)
                        .environmentObject(mapViewModel)
                        .transition(.move(edge: .bottom))
                        .animation(.easeInOut)
                        .offset(y: sheetHeightOffset)
                        .gesture(
                            DragGesture(coordinateSpace: .local)
                                .onChanged { value in
                                    UIApplication.shared.endEditing()
                                    if value.location.y >= geo.size.height * sheetGrabOffset {
                                        sheetHeightOffset = value.location.y - geo.size.height * sheetGrabOffset
                                    }
                                }
                                .onEnded { value in
                                    if value.location.y > sheetHideHeight {
                                        sheetHeightOffset = sheetHideHeight
                                    }
                                }
                        )
                }
                
            }
            .edgesIgnoringSafeArea(.bottom)
            .onAppear {
                sheetHeightOffset = initialSheetHeightOffset
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
    @Binding var sheetHeightOffset: CGFloat
    @Binding var isKeyboardVisible: Bool
    
    @EnvironmentObject var mapViewModel: MapViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Button(action: {
                    mapViewModel.recenterDotAnnotation()
                    mapViewModel.recenterMap()
                }) {
                    //TODO figure out why this isn't working
                    if mapViewModel.isCenterCloseToUserLocation {
                        UpAndSettingsButtonView(systemImageName: "location.fill")
                    }
                    else {
                        UpAndSettingsButtonView(systemImageName: "location")
                    }
                }
                .background(Color.blue)
                .clipShape(Circle())
                .padding(20)
                Spacer()
                Button(action: {
                    if sheetHeightOffset < sheetHideHeight {
                        //if the sheet isn't being hidden, we navigate to the settings page
                        //TODO navigate to settings page
                    }
                    else {
                        //otherwise, we simply move the sheet back up
                        sheetHeightOffset = initialSheetHeightOffset
                    }
                }) {
                    if sheetHeightOffset < sheetHideHeight {
                        //if the sheet isn't being hidden, we show the settings icon
                        UpAndSettingsButtonView(systemImageName: "gear")
                    }
                    else {
                        //otherwise, we show an up arrow
                        UpAndSettingsButtonView(systemImageName: "arrow.up.circle")
                    }
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
                NearbyListView(initialSheetHeightOffset: initialSheetHeightOffset, sheetHeightOffset: $sheetHeightOffset, isKeyboardVisible: $isKeyboardVisible)
                    .environmentObject(mapViewModel)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(UIColor.systemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 15))
        }
    }
}

struct UpAndSettingsButtonView: View {
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
    @Binding var sheetHeightOffset: CGFloat
    @Binding var isKeyboardVisible: Bool
    
    @EnvironmentObject var mapViewModel: MapViewModel
    
    //TODO maybe add a toggle for only showing accessible stops in a settings menu
//    @State private var showIsADACompliant = true
    @State private var firstStopIndex: Double = 0.0
    @State private var searchText = ""
    @State private var scrollOffset: CGFloat = 0.0
    
    var userRadius: Double = 0.25 //Miles
    var userRadialRegion: RadialRegion {
        //Only use the current user pin location if the user hasn't selected a stop yet
        if mapViewModel.selectedTerminal == nil {
            return RadialRegion(latitude: mapViewModel.view.region.center.latitude, longitude: mapViewModel.view.region.center.longitude, radiusInMiles: userRadius)
        }
        else {
//            print("using prev lat long")
//            print("prevLatitude: \(mapViewModel.userPinLocationWhenTerminalSelected.latitude) | prevLongitude: \(mapViewModel.userPinLocationWhenTerminalSelected.longitude)")
            return RadialRegion(latitude: mapViewModel.userPinLocationWhenTerminalSelected.latitude, longitude: mapViewModel.userPinLocationWhenTerminalSelected.longitude, radiusInMiles: userRadius)
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                //TODO navigate to searchview with animation when tapped like the Transit app
                TextField("Line or destination", text: $searchText)
                    .onTapGesture {
                        isKeyboardVisible = true
                        sheetHeightOffset = 0
                    }
                    .padding(8)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal, 20)
                    .background(Color.clear)
                
                ScrollViewReader { scrollViewProxy in
                    List(userRadialRegion.getTerminals(), id: \.self) { stop in
                        if  searchText.isEmpty ||
                                stop.fullName.localizedCaseInsensitiveContains(searchText) ||
                                stop.lines.contains(where: { line in
                                    return line.shortName.localizedCaseInsensitiveContains(searchText)
                                }) {
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
                    .overlay(
                        GeometryReader { geometry in
                            Color.clear
                                .onChange(of: scrollOffset) { _ in
                                    scrollViewProxy.scrollTo(scrollOffset, anchor: .top)
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
        }
    }
}

struct StopView: View {
    var stop: Terminal
    
    @StateObject private var trdata: TerminalRequestData = TerminalRequestData()
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
                Spacer()
                Spacer()
                Label("Select a train to be notified when it is approaching the station you selected.", systemImage: "info.circle")
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
            let infoString = await trdata.getTerminalInfo(terminalID: stop.id)
            self.terminalInfoString = infoString ?? ""
        }
    }
}

struct TrainButtonRow: View {
    var train: Train
    
    @State private var showAlert = false
    private var lineName: String {
        Line(rawValue: train.lineName!)!.shortName
    }
    @EnvironmentObject var mapViewModel: MapViewModel
    
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
        .task {
            mapViewModel.placeTrainAnnotation(train: train)
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
