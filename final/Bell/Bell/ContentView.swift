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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ContentView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 41.92323320, longitude: -87.65379270), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    @State private var sheetHeightOffset: CGFloat = 0
    @State private var isKeyboardVisible: Bool = false
    
    let initialSheetHeightOffset: CGFloat = UIScreen.main.bounds.height * 0.4;
    let sheetGrabOffset: Double = 0.18;
    let sheetHideHeight: Double = UIScreen.main.bounds.height * 0.8;
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .bottomLeading) {
                Map(coordinateRegion: $region)
                    .onTapGesture {
                        if isKeyboardVisible {
                            UIApplication.shared.endEditing()
                            sheetHeightOffset = initialSheetHeightOffset
                        }
                    }
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    CustomSheetView(initialSheetHeightOffset: initialSheetHeightOffset, sheetHideHeight: sheetHideHeight, sheetHeightOffset: $sheetHeightOffset, isKeyboardVisible: $isKeyboardVisible)
                        .transition(.move(edge: .bottom))
                        .animation(.easeInOut)
                        .offset(y: sheetHeightOffset)
                        .gesture(
                            DragGesture(coordinateSpace: .local)
                                .onChanged { value in
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
}

struct CustomSheetView: View {
    var initialSheetHeightOffset: CGFloat
    var sheetHideHeight: CGFloat
    @Binding var sheetHeightOffset: CGFloat
    @Binding var isKeyboardVisible: Bool
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
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
    
    //TODO maybe add a toggle for only showing accessible stops in a settings menu
//    @State private var showIsADACompliant = true
    @State private var firstStopIndex: Double = 0.0
    @State private var searchText = ""
    @State private var scrollOffset: CGFloat = 0.0
    
    var body: some View {
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
                //TODO change 'Terminal.allCases.indices' to stops within a certain radius of the user's location
                List(Terminal.allCases.indices, id: \.self) { index in
                    let stop = Terminal.allCases[index]

                    if stop.fullName.localizedCaseInsensitiveContains(searchText) ||
                        stop.lines.contains(where: { lineName in
                            return lineName.localizedCaseInsensitiveContains(searchText)
                        }) {
                        //TODO add this navigation link back in with new stopview
    //                    NavigationLink(destination: StopView(stop: stop)) {
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
                Spacer()
            }
        }
    }
}

struct StopRow: View {
    var stop: Terminal
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(stop.fullName).font(.title2)
                Text(String(stop.id)).font(.subheadline).foregroundColor(.secondary)
            }
            Spacer()
        }
    }
}
