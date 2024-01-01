//
//  ChargingView.swift
//  desk-fella
//
//  Created by Cem Ergin on 01/01/2024.
//

import SwiftUI

struct ChargingView: View {
    @EnvironmentObject private var homeViewModel: HomeViewModel
    
    var body: some View {
        VStack {
            Text("\(homeViewModel.numberFormatter.chargeFormatter().string(from: NSNumber(value: homeViewModel.batteryLevel))!)% Charged").foregroundStyle(.gray).onAppear {
                getBatteryLevel()
                let _ = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                    getBatteryLevel()
                }
            }
            if UIDevice.current.batteryState.rawValue == 2 {
                Text("Charging").foregroundStyle(.gray)
            }
        }
    }
    
    func getBatteryLevel() {
        homeViewModel.batteryLevel = UIDevice.current.batteryLevel * 100
    }
}

#Preview {
    ChargingView()
        .environmentObject(HomeViewModel())
}
