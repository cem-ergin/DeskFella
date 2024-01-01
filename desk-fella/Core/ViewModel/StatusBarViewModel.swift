//
//  StatusBarViewModel.swift
//  desk-fella
//
//  Created by Cem Ergin on 01/01/2024.
//

import Foundation

class StatusBarViewModel: ObservableObject {
    @Published var showStatusBar: Bool = UserDefaults.standard.object(forKey: Constants.UserDefaultsKeys.showStatusBar) == nil ? false :UserDefaults.standard.bool(forKey: Constants.UserDefaultsKeys.showStatusBar)
}
