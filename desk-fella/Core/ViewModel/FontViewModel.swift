//
//  FontState.swift
//  desk-fella
//
//  Created by Cem Ergin on 01/01/2024.
//

import Foundation

class FontViewModel: ObservableObject {
    @Published var font: String = UserDefaults.standard.string(forKey: Constants.UserDefaultsKeys.font) ?? "Verdana"
}
