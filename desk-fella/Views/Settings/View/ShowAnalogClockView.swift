//
//  ShowAnalogClockView.swift
//  desk-fella
//
//  Created by Cem Ergin on 31/12/2023.
//

import SwiftUI

struct ShowAnalogClockView: View {
    @EnvironmentObject var displayViewModel: DisplayViewModel
    
    var body: some View {
        Toggle(
            isOn: Binding(
                get: {
                    displayViewModel.showAnalogClock
                },
                set: { value in
                    displayViewModel.showAnalogClock = value
                    UserDefaults.standard.set(
                        value,
                        forKey: Constants.UserDefaultsKeys.showAnalogClock
                    )
                }
            )
        ) {
            Text(
                "Show analog clock"
            )
        }
    }
}

#Preview {
    ShowAnalogClockView()
        .environmentObject(DisplayViewModel())
}
