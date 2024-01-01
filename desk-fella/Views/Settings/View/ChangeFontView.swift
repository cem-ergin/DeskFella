//
//  ChangeFontView.swift
//  desk-fella
//
//  Created by Cem Ergin on 31/12/2023.
//

import SwiftUI
import SUIFontPicker

struct ChangeFontView: View {
    @EnvironmentObject var settingsViewModel: SettingsViewModel
    @EnvironmentObject var fontViewModel: FontViewModel
    
    var body: some View {
        Button(
            action: {
                settingsViewModel.isFontPickerPresented = true
            },
            label: {
                Text(
                    "Change font"
                )
            }
        )
        .sheet(
            isPresented: $settingsViewModel.isFontPickerPresented
        ) {
            HStack {
                Spacer()
                Button(
                    action: {
                        settingsViewModel.isFontPickerPresented = false
                    },
                    label: {
                        Text(
                            "Close"
                        )
                    }
                ).padding()
            }
            
            SUIFontPicker { fontDescriptor in
                let customFont = UIFont(
                    descriptor: fontDescriptor,
                    size: 18.0
                )
                print(
                    "fontName: \(customFont.fontName)"
                )
                fontViewModel.font = customFont.fontName
                UserDefaults.standard.setValue(
                    customFont.fontName,
                    forKey: Constants.UserDefaultsKeys.font
                )
            }
        }    }
}

#Preview {
    ChangeFontView()
        .environmentObject(SettingsViewModel())
        .environmentObject(FontViewModel())
}
