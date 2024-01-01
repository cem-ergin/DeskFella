//
//  ShowChargingView.swift
//  desk-fella
//
//  Created by Cem Ergin on 31/12/2023.
//

import SwiftUI

struct ShowChargingView: View {
    @EnvironmentObject var displayViewModel: DisplayViewModel

    var body: some View {
        Toggle(
            isOn: Binding(
                get: {
                    displayViewModel.showCharging
                },
                set: { value in
                    displayViewModel.showCharging = value
                    UserDefaults.standard.set(
                        value,
                        forKey: Constants.UserDefaultsKeys.showCharging
                    )
                }
            )
        ) {
            Text(
                "Show charging"
            )
        }
    }
}

#Preview {
    ShowChargingView()
        .environmentObject(DisplayViewModel())
}
