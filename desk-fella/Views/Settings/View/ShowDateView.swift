//
//  ShowDateView.swift
//  desk-fella
//
//  Created by Cem Ergin on 31/12/2023.
//

import SwiftUI

struct ShowDateView: View {
    @EnvironmentObject var displayViewModel: DisplayViewModel

    var body: some View {
        Toggle(
            isOn: Binding(
                get: {
                    displayViewModel.showDate
                },
                set: { value in
                    displayViewModel.showDate = value
                    UserDefaults.standard.set(
                        value,
                        forKey: Constants.UserDefaultsKeys.showDate
                    )
                }
            )
        ) {
            Text(
                "Show date"
            )
        }
    }
}

#Preview {
    ShowDateView()
        .environmentObject(DisplayViewModel())
}
