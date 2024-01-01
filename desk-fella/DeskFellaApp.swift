//
//  desk-fella.swift
//  desk-fella
//
//  Created by Cem Ergin on 13/12/2023.
//

import SwiftUI

@main
struct desk_fellaApp: App {
    @StateObject var fontViewModel = FontViewModel()
    @StateObject var statusBarViewModel = StatusBarViewModel()
    
    init() {
        UIDevice.current.isBatteryMonitoringEnabled = true
        UIApplication.shared.isIdleTimerDisabled = true
    }
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .statusBar(hidden: !statusBarViewModel.showStatusBar)
        }.environment(\.font, Font.custom(fontViewModel.font, size: 14))
            .environmentObject(fontViewModel)
            .environmentObject(statusBarViewModel)
    }
}
