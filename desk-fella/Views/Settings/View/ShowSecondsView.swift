//
//  ShowSecondsView.swift
//  desk-fella
//
//  Created by Cem Ergin on 31/12/2023.
//

import SwiftUI

struct ShowSecondsView: View {
    @EnvironmentObject var displayViewModel: DisplayViewModel

    var body: some View {
        Toggle(
            isOn: Binding(
                get: {
                    displayViewModel.showSeconds
                },
                set: { value in
                    displayViewModel.showSeconds = value
                    UserDefaults.standard.set(
                        value,
                        forKey: Constants.UserDefaultsKeys.showSeconds
                    )
                }
            )
        ) {
            Text(
                "Show seconds"
            )
        }
    }
}

#Preview {
    ShowSecondsView()
        .environmentObject(DisplayViewModel())
}
