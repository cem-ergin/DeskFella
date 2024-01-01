//
//  ContentView.swift
//
//  Created by Cem Ergin on 13/12/2023.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var settingsViewModel = SettingsViewModel()
    @EnvironmentObject var fontViewModel: FontViewModel
    @EnvironmentObject var statusBarViewModel: StatusBarViewModel
    
    @StateObject var displayViewModel = DisplayViewModel()
    @StateObject var homeViewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack(path: $homeViewModel.path) {
            VStack {
                ZStack {
                    SettingsButtonView()
                        .environmentObject(homeViewModel)
                    VStack {
                        if displayViewModel.showAnalogClock {
                            AnalogClockView().frame(width: 200, height: 200)
                        } else {
                            TextClockView()
                                .environmentObject(displayViewModel)
                                .environmentObject(fontViewModel)
                                .environmentObject(homeViewModel)
                        }
                        
                        if displayViewModel.showDate {
                            DateView()
                                .environmentObject(fontViewModel)
                                .environmentObject(homeViewModel)
                        }
                        if displayViewModel.showCharging {
                            ChargingView()
                                .environmentObject(homeViewModel)
                        }
                        NoteView()
                            .environmentObject(displayViewModel)
                    }
                }
            }.padding()
                .background(Color.black)
                .onTapGesture {
                    homeViewModel.onTap()
                }
                .gesture(DragGesture()
                    .onChanged { value in
                        homeViewModel.onDragGestureChanged(value: value)
                    }
                    .onEnded({ _ in
                        homeViewModel.onDragGestureEnded()
                    })
                ).navigationDestination(for: SettingsNavigation.self, destination: { destination in
                    SettingsView()
                        .environmentObject(settingsViewModel)
                        .environmentObject(displayViewModel)
                        .environmentObject(fontViewModel)
                        .environmentObject(statusBarViewModel)
                })
        }.statusBar(hidden: !statusBarViewModel.showStatusBar)
            .persistentSystemOverlays(!statusBarViewModel.showStatusBar ? .hidden : .visible)
    }
}

#Preview {
    HomeView()
        .environmentObject(DisplayViewModel.init())
        .environmentObject(FontViewModel.init())
        .environmentObject(StatusBarViewModel.init())
        .environmentObject(SettingsViewModel.init())
}


struct SettingsNavigation: Hashable {}
