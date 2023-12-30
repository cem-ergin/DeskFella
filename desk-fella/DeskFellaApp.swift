//
//  desk-fella.swift
//  desk-fella
//
//  Created by Cem Ergin on 13/12/2023.
//

import SwiftUI

class FontState: ObservableObject {
    @Published var font: String = UserDefaults.standard.string(forKey: Constants.UserDefaultsKeys.font) ?? "Verdana"
}

class StatusBarState: ObservableObject {
    @Published var showStatusBar: Bool = UserDefaults.standard.object(forKey: Constants.UserDefaultsKeys.showStatusBar) == nil ? false :UserDefaults.standard.bool(forKey: Constants.UserDefaultsKeys.showStatusBar)
}

@main
struct desk_fellaApp: App {
    @StateObject var fontState = FontState()
    @StateObject var statusBarState = StatusBarState()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .statusBar(hidden: !statusBarState.showStatusBar)
        }.environment(\.font, Font.custom(fontState.font, size: 14))
            .environmentObject(fontState)
            .environmentObject(statusBarState)
    }
}
