//
//  SettingsView.swift
//
//  Created by Cem Ergin on 13/12/2023.
//

import SwiftUI
import SUIFontPicker

struct SettingsView: View {
    @EnvironmentObject var fontState: FontState
    @EnvironmentObject var statusBarState: StatusBarState
    @EnvironmentObject var sharedState: SharedState
    @State private var textInput: String = ""
    @State private var isFontPickerPresented = false
    @State private var isAutoOpenWhenChargingAlertPresented = false

    @Environment(\.openURL) var openURL
    
    var body: some View {
        Form {
            Section(header: Text("Display Settings")) {
                Toggle(isOn: Binding(
                    get: { statusBarState.showStatusBar },
                    set: { value in
                        statusBarState.showStatusBar = value
                        UserDefaults.standard.set(value, forKey: Constants.UserDefaultsKeys.showStatusBar)
                    }
                )) {
                    Text("Show status bar")
                }
                Toggle(isOn: Binding(
                    get: { sharedState.showAnalogClock },
                    set: { value in
                        sharedState.showAnalogClock = value
                        UserDefaults.standard.set(value, forKey: Constants.UserDefaultsKeys.showAnalogClock)
                    }
                )) {
                    Text("Show analog clock")
                }
                Toggle(isOn: Binding(
                    get: { sharedState.showHour },
                    set: { value in
                        sharedState.showHour = value
                        UserDefaults.standard.set(value, forKey: Constants.UserDefaultsKeys.showHour)
                    }
                )) {
                    Text("Show hour")
                }
                Toggle(isOn: Binding(
                    get: { sharedState.showMinute },
                    set: { value in
                        sharedState.showMinute = value
                        UserDefaults.standard.set(value, forKey: Constants.UserDefaultsKeys.showMinute)
                    }
                ))  {
                    Text("Show minute")
                }
                Toggle(isOn: Binding(
                    get: { sharedState.showSeconds },
                    set: { value in
                        sharedState.showSeconds = value
                        UserDefaults.standard.set(value, forKey: Constants.UserDefaultsKeys.showSeconds)
                    }
                ))  {
                    Text("Show seconds")
                }
                Toggle(isOn: Binding(
                    get: { sharedState.showDate },
                    set: { value in
                        sharedState.showDate = value
                        UserDefaults.standard.set(value, forKey: Constants.UserDefaultsKeys.showDate)
                    }
                ))  {
                    Text("Show date")
                }
                Toggle(isOn: Binding(
                    get: { sharedState.showCharging },
                    set: { value in
                        sharedState.showCharging = value
                        UserDefaults.standard.set(value, forKey: Constants.UserDefaultsKeys.showCharging)
                    }
                ))  {
                    Text("Show charging")
                }
                
            }
            Section(header: Text("Note")) {
                TextField("Note", text: $textInput)
                    .onChange(of: textInput) { oldValue, newValue in
                        print(newValue)
                        sharedState.note = newValue
                        UserDefaults.standard.set(newValue, forKey: Constants.UserDefaultsKeys.note)
                    }
                    .onAppear(perform: {
                        textInput = sharedState.note
                    })
            }
            Section(header: Text("Fonts")) {
                Button(action: {
                    isFontPickerPresented = true
                }, label: {
                    Text("Change font")
                })
                .sheet(isPresented: $isFontPickerPresented) {
                    HStack {
                        Spacer()
                        Button(action: {isFontPickerPresented = false}, label: {
                            Text("Close")
                        }).padding()
                    }
                    
                    SUIFontPicker { fontDescriptor in
                        let customFont = UIFont(descriptor: fontDescriptor, size: 18.0)
                        print("fontName: \(customFont.fontName)")
                        fontState.font = customFont.fontName
                        UserDefaults.standard.setValue(customFont.fontName, forKey: Constants.UserDefaultsKeys.font)
                    }
                }
            }
            
            Section(header: Text("Social")) {
                Link(destination: URL(string: Constants.URLs.discordInvitationUrl)!, label: {
                    HStack {
                        Image(uiImage: UIImage(imageLiteralResourceName: Constants.Icons.discordIcon)) .resizable()
                            .frame(width: 24, height: 24)
                        Text("Discord").padding(.leading, 8)
                    }
                })
            }
            
            Section(header: Text("Tips")) {
                Button(action: {
                    isAutoOpenWhenChargingAlertPresented = true
                }, label: {
                    Text("Automatically open the app when charger plugged")
                })
                .alert(isPresented: $isAutoOpenWhenChargingAlertPresented, content: {
                    Alert(title: Text("Instructions"), message: Text(LocalizedStringKey("1- Open Shortcuts App -> Automation\n2- New Automation\n3- Press on 'Charger' -> Run Immediately\n4- New blank automation\n5- Find and press 'Open App'\n6-Press on 'App' and choose Desk Fella\nNow Desk Fella will open each time you put your phone to charge.")),  primaryButton: .default(
                        Text("OK"),
                        action: {
                            isAutoOpenWhenChargingAlertPresented = false
                        }
                    ),
                          secondaryButton:.default(
                            Text("Video Instructions"),
                            action: {
                                openURL(URL(string: "https://www.youtube.com/shorts/uZEo5O-tYrs")!)
                            }
                          )
                    )
                }
                )
            }
        }
        .navigationTitle("Settings")
        .colorScheme(.dark)
    }
}

#Preview {
    SettingsView()
        .environmentObject(SharedState.init())
        .environmentObject(FontState.init())
        .environmentObject(StatusBarState.init())
}
