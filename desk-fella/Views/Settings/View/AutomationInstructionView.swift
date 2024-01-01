//
//  AutomationInstructionView.swift
//  desk-fella
//
//  Created by Cem Ergin on 31/12/2023.
//

import SwiftUI

struct AutomationInstructionView: View {
    @EnvironmentObject var settingsViewModel: SettingsViewModel
    
    var body: some View {
        Button(
            action: {
                settingsViewModel.isAutoOpenWhenChargingAlertPresented = true
            },
            label: {
                Text(
                    "Automatically open the app when charger plugged"
                )
            }
        )
        .alert(
            isPresented: $settingsViewModel.isAutoOpenWhenChargingAlertPresented,
            content: {
                Alert(
                    title: Text(
                        "Instructions"
                    ),
                    message: Text(
                        LocalizedStringKey(
                            "1- Open Shortcuts App -> Automation\n2- New Automation\n3- Press on 'Charger' -> Run Immediately\n4- New blank automation\n5- Find and press 'Open App'\n6-Press on 'App' and choose Desk Fella\nNow Desk Fella will open each time you put your phone to charge."
                        )
                    ),
                    primaryButton: .default(
                        Text(
                            "OK"
                        ),
                        action: {
                            settingsViewModel.isAutoOpenWhenChargingAlertPresented = false
                        }
                    ),
                    secondaryButton: .default(
                        Text(
                            "Video Instructions"
                        ),
                        action: {
                            settingsViewModel.openURL(
                                URL(
                                    string: "https://www.youtube.com/shorts/uZEo5O-tYrs"
                                )!
                            )
                        }
                    )
                )
            }
        )
    }
}

#Preview {
    AutomationInstructionView()
        .environmentObject(SettingsViewModel())
}
