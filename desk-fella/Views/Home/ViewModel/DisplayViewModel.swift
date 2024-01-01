//
//  SharedState.swift
//  desk-fella
//
//  Created by Cem Ergin on 31/12/2023.
//

import Foundation

class DisplayViewModel: ObservableObject {
    @Published var showHour: Bool = UserDefaults.standard.object(forKey: Constants.UserDefaultsKeys.showHour) == nil ? true : UserDefaults.standard.bool(forKey: Constants.UserDefaultsKeys.showHour)
    @Published var showMinute: Bool = UserDefaults.standard.object(forKey: Constants.UserDefaultsKeys.showMinute) == nil ? true :UserDefaults.standard.bool(forKey: Constants.UserDefaultsKeys.showMinute)
    @Published var showSeconds: Bool = UserDefaults.standard.object(forKey: Constants.UserDefaultsKeys.showSeconds) == nil ? true :UserDefaults.standard.bool(forKey: Constants.UserDefaultsKeys.showSeconds)
    
    @Published var showDate: Bool = UserDefaults.standard.object(forKey: Constants.UserDefaultsKeys.showDate) == nil ? true :UserDefaults.standard.bool(forKey: Constants.UserDefaultsKeys.showDate)
    @Published var showCharging: Bool = UserDefaults.standard.object(forKey: Constants.UserDefaultsKeys.showCharging) == nil ? true :UserDefaults.standard.bool(forKey: Constants.UserDefaultsKeys.showCharging)
    
    @Published var showAnalogClock: Bool = UserDefaults.standard.object(forKey: Constants.UserDefaultsKeys.showAnalogClock) == nil ? false :UserDefaults.standard.bool(forKey: Constants.UserDefaultsKeys.showAnalogClock)
    
    @Published var note: String = UserDefaults.standard.string(forKey: Constants.UserDefaultsKeys.note) ?? ""
}
