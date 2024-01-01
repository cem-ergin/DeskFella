//
//  SettingsView.swift
//
//  Created by Cem Ergin on 13/12/2023.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var settingsViewModel: SettingsViewModel
    @EnvironmentObject var fontViewModel: FontViewModel
    @EnvironmentObject var statusBarViewModel:  StatusBarViewModel
    @EnvironmentObject var displayViewModel: DisplayViewModel
    
    var body: some View {
        Form {
            Section(
                header: Text(
                    "Display Settings"
                )
            ) {
                ShowStatusBarView()
                ShowAnalogClockView()
                ShowHourView()
                ShowMinuteView()
                ShowSecondsView()
                ShowDateView()
                ShowChargingView()
            }
            Section(
                header: Text(
                    "Note"
                )
            ) {
                EditNoteView()
            }
            Section(
                header: Text(
                    "Fonts"
                )
            ) {
                ChangeFontView()
            }
            
            Section(
                header: Text(
                    "Social"
                )
            ) {
                DiscordInvitationView()
            }
            
            Section(
                header: Text(
                    "Tips"
                )
            ) {
                AutomationInstructionView()
            }
        }
        .navigationTitle(
            "Settings"
        )
        .colorScheme(
            .dark
        )
    }
}

#Preview {
    SettingsView()
        .environmentObject(
            SettingsViewModel.init()
        )
        .environmentObject(
            DisplayViewModel.init()
        )
        .environmentObject(
            FontViewModel.init()
        )
        .environmentObject(
            StatusBarViewModel.init()
        )
    
}
