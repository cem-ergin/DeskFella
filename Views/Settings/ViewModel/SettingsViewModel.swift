//
//  SettingsViewModel.swift
//  desk-fella
//
//  Created by Cem Ergin on 30/12/2023.
//

import Foundation
import SwiftUI

class SettingsViewModel: ObservableObject {
    @Published var textInput: String = ""
    @Published var isFontPickerPresented = false
    @Published var isAutoOpenWhenChargingAlertPresented = false
    @Environment(\.openURL) var openURL
}
