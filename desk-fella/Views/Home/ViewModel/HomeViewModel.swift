//
//  swift
//  desk-fella
//
//  Created by Cem Ergin on 01/01/2024.
//

import Foundation
import SwiftClockUI
import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var currentDate = Date()
    @Published var batteryLevel: Float = 0
    @Published var showSettings = false
    @Published var timer: Timer? = nil
    @Published var currentDelta: CGFloat = 0.0
    @Published var previousDelta: CGFloat = 0.0
    @Published var clockStyle: ClockStyle = .classic
    @Published var path = NavigationPath()
    
    var dateFormatter = DateFormatter()
    var numberFormatter = NumberFormatter()
    
    func onTap() {
        withAnimation {
            showSettings = true
        }
        
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
            withAnimation {
                self.showSettings = false
            }
        }
    }
    
    func onDragGestureEnded() {
        previousDelta = 0
    }
    
    func onDragGestureChanged(value: DragGesture.Value) {
        let delta = Double(value.translation.height)
        currentDelta = delta - previousDelta
        if currentDelta <= 10 && currentDelta >= -10 {
            currentDelta *= 100
        }
        let sensitivity: Double = 5000
        let brightness = max(min(UIScreen.main.brightness - currentDelta / sensitivity, 1.0), 0.0)
        
        UIScreen.main.brightness = CGFloat(brightness)
        
        previousDelta = delta
    }
}
