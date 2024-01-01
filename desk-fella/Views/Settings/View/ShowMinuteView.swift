//
//  ShowMinuteView.swift
//  desk-fella
//
//  Created by Cem Ergin on 31/12/2023.
//

import SwiftUI

struct ShowMinuteView: View {
    @EnvironmentObject var displayViewModel: DisplayViewModel
    
    var body: some View {
        Toggle(
            isOn: Binding(
                get: {
                    displayViewModel.showMinute
                },
                set: { value in
                    displayViewModel.showMinute = value
                    UserDefaults.standard.set(
                        value,
                        forKey: Constants.UserDefaultsKeys.showMinute
                    )
                }
            )
        ) {
            Text(
                "Show minute"
            )
        }
    }
}

#Preview {
    ShowMinuteView()
        .environmentObject(DisplayViewModel())
}
