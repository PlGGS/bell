//
//  ContentView.swift
//  Bell
//
//  Created by Blake Boris on 5/31/23.
//

import SwiftUI
import MapKit

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ContentView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 41.92323320, longitude: -87.65379270), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    @State private var sheetHeightOffset = CGFloat.zero
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Map(coordinateRegion: $region).edgesIgnoringSafeArea(.all)
            VStack {
                CustomSheetView(sheetHeightOffset: $sheetHeightOffset)
                    .transition(.move(edge: .bottom))
                    .animation(.easeInOut)
                    .offset(y: sheetHeightOffset)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                print(value.location.y)
                                if value.location.y >= 175 {
                                    sheetHeightOffset = value.location.y - 175
                                }
                            }
                            .onEnded { value in
//                                if value.location.y > 376.5 {
//                                    sheetHeightOffset = 376.5
//                                }
                                if value.location.y < 175 {
                                    sheetHeightOffset = 0
                                }
                            }
                    )
            }
            
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct CustomSheetView: View {
    @Binding var sheetHeightOffset: CGFloat
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Spacer()
                Button(action: {
                    sheetHeightOffset = 0
                    print(sheetHeightOffset)
                }) {
                    Image(systemName: "plus")
                        .font(.system(size: 24))
                        .foregroundColor(.white)
                        .padding()
                        .background(Circle())
                }
                .background(Color.blue)
                .clipShape(Circle())
                .padding(30)
            }
            VStack {
                RoundedRectangle(cornerRadius: 2)
                    .fill(.gray)
                    .frame(width: 50, height: 5)
                    .padding(.top)
                NearbyListView()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black.opacity(0.6))
            .clipShape(RoundedRectangle(cornerRadius: 15))
        }
    }
}

struct NearbyListView: View {
    //TODO maybe add a toggle for only showing accessible stops in a settings menu
//    @State private var showIsADACompliant = true
    @State private var firstStopIndex: Double = 0.0
    @State private var searchText = ""
    
    var body: some View {
        VStack {
            //TODO navigate to searchview with animation when tapped like the Transit app
            TextField("Line or destination", text: $searchText)
                .padding(8)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 20)
            
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
                            if stop.isADACompliant {
                                Image(systemName: "figure.roll")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 24, height: 24)
                            }
                            Spacer()
                        }
//                    }
                }
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
