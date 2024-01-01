//
//  AnalogClockViewModel.swift
//  desk-fella
//
//  Created by Cem Ergin on 01/01/2024.
//

import Foundation
import SwiftUI

class AnalogClockViewModel: ObservableObject {
    @Published var currentTime = Date()
    
    var timer: Timer {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            let seconds = Double(Calendar.current.component(.second, from: self.currentTime))
            if seconds != 59 {
                withAnimation {
                    self.currentTime = Date()
                }
            } else {
                self.currentTime = Date()
            }
        }
    }
    
}
