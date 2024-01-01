//
//  NoteView.swift
//  desk-fella
//
//  Created by Cem Ergin on 31/12/2023.
//

import SwiftUI

struct EditNoteView: View {
    @EnvironmentObject var settingsViewModel: SettingsViewModel
    @EnvironmentObject var displayViewModel: DisplayViewModel
    
    var body: some View {
        VStack {
            TextField(
                "Note",
                text: $settingsViewModel.textInput
            )
            .onChange(
                of: settingsViewModel.textInput
            ) {
                oldValue, newValue in
                print(newValue)
                displayViewModel.note = newValue
                UserDefaults.standard.set(
                    newValue,
                    forKey: Constants.UserDefaultsKeys.note
                )
            }
        }
        .onAppear(perform: {
            settingsViewModel.textInput = displayViewModel.note
        })
    }
}

#Preview {
    EditNoteView()
        .environmentObject(SettingsViewModel())
        .environmentObject(DisplayViewModel())
}
