//
//  ShowHourView.swift
//  desk-fella
//
//  Created by Cem Ergin on 31/12/2023.
//

import SwiftUI

struct ShowHourView: View {
    @EnvironmentObject var displayViewModel: DisplayViewModel

    var body: some View {
        Toggle(
            isOn: Binding(
                get: {
                    displayViewModel.showHour
                },
                set: { value in
                    displayViewModel.showHour = value
                    UserDefaults.standard.set(
                        value,
                        forKey: Constants.UserDefaultsKeys.showHour
                    )
                }
            )
        ) {
            Text(
                "Show hour"
            )
        }
    }
}

#Preview {
    ShowHourView()
        .environmentObject(DisplayViewModel())
}
