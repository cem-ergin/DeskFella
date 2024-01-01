//
//  ShowStatusBarView.swift
//  desk-fella
//
//  Created by Cem Ergin on 31/12/2023.
//

import SwiftUI

struct ShowStatusBarView: View {
    @EnvironmentObject var statusBarViewModel:  StatusBarViewModel
    
    var body: some View {
        Toggle(
            isOn: Binding(
                get: {
                    statusBarViewModel.showStatusBar
                },
                set: { value in
                    statusBarViewModel.showStatusBar = value
                    UserDefaults.standard.set(
                        value,
                        forKey: Constants.UserDefaultsKeys.showStatusBar
                    )
                }
            )
        ) {
            Text(
                "Show status bar"
            )
        }
    }
}

#Preview {
    ShowStatusBarView()
        .environmentObject(StatusBarViewModel())
}
