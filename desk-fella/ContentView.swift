//
//  ContentView.swift
//
//  Created by Cem Ergin on 13/12/2023.
//

import SwiftUI
import SwiftClockUI

class SharedState: ObservableObject {
    @Published var showHour: Bool = UserDefaults.standard.object(forKey: Constants.UserDefaultsKeys.showHour) == nil ? true : UserDefaults.standard.bool(forKey: Constants.UserDefaultsKeys.showHour)
    @Published var showMinute: Bool = UserDefaults.standard.object(forKey: Constants.UserDefaultsKeys.showMinute) == nil ? true :UserDefaults.standard.bool(forKey: Constants.UserDefaultsKeys.showMinute)
    @Published var showSeconds: Bool = UserDefaults.standard.object(forKey: Constants.UserDefaultsKeys.showSeconds) == nil ? true :UserDefaults.standard.bool(forKey: Constants.UserDefaultsKeys.showSeconds)
    
    @Published var showDate: Bool = UserDefaults.standard.object(forKey: Constants.UserDefaultsKeys.showDate) == nil ? true :UserDefaults.standard.bool(forKey: Constants.UserDefaultsKeys.showDate)
    @Published var showCharging: Bool = UserDefaults.standard.object(forKey: Constants.UserDefaultsKeys.showCharging) == nil ? true :UserDefaults.standard.bool(forKey: Constants.UserDefaultsKeys.showCharging)
    
    @Published var showAnalogClock: Bool = UserDefaults.standard.object(forKey: Constants.UserDefaultsKeys.showAnalogClock) == nil ? false :UserDefaults.standard.bool(forKey: Constants.UserDefaultsKeys.showAnalogClock)
    
    @Published var note: String = UserDefaults.standard.string(forKey: Constants.UserDefaultsKeys.note) ?? ""
}

struct ContentView: View {
    @EnvironmentObject var fontState: FontState
    @EnvironmentObject var statusBarState: StatusBarState
    @StateObject var sharedState = SharedState()
    
    @State private var currentDate = Date()
    @State private var batteryLevel: Float = 0
    @State private var showSettings = false
    @State private var timer: Timer? = nil
    @State private var currentDelta: CGFloat = 0.0
    @State private var previousDelta: CGFloat = 0.0
    
    @State private var clockStyle: ClockStyle = .classic
    
    @State private var path = NavigationPath()
    
    func getHourFormatter() -> DateFormatter {
        let formatter = DateFormatter()
        
        if sharedState.showHour {
            formatter.dateFormat += "HH:"
        }
        if sharedState.showMinute {
            formatter.dateFormat += "mm:"
        }
        if sharedState.showSeconds {
            formatter.dateFormat += "ss"
        }
        
        if formatter.dateFormat.hasSuffix(":") {
            formatter.dateFormat.removeLast()
        }
        
        return formatter
    }
    
    let dateFormatter : DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd"
        return formatter
    }()
    
    let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    
    init() {
        UIDevice.current.isBatteryMonitoringEnabled = true
        UIApplication.shared.isIdleTimerDisabled = true
    }
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                ZStack {
                    VStack{
                        HStack {
                            Spacer()
                            if showSettings {
                                withAnimation {
                                    Button(action: {
                                        withAnimation {
                                            showSettings = false
                                        }
                                        
                                        path.append(SettingsNavigation())
                                    }, label: {
                                        Label("Settings", systemImage: "gear")
                                    })
                                }
                            }
                        }
                        Spacer()
                    }
                    VStack {
                        if sharedState.showAnalogClock {
                            AnalogClockView().frame(width: 200, height: 200)
                        } else {
                            Text(getHourFormatter().string(from: currentDate)).foregroundStyle(.gray).font(.custom(fontState.font, size: 72)).onAppear {
                                let _ = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                                    currentDate = Date()
                                }
                            }
                        }
                        
                        if sharedState.showDate {
                            Text(dateFormatter.string(from: currentDate)).foregroundStyle(.gray).font(.custom(fontState.font, size: 24))
                        }
                        if sharedState.showCharging {
                            VStack {
                                Text("\(numberFormatter.string(from: NSNumber(value: batteryLevel))!)% Charged").foregroundStyle(.gray).onAppear {
                                    getBatteryLevel()
                                    let _ = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                                        getBatteryLevel()
                                    }
                                }
                                if UIDevice.current.batteryState.rawValue == 2 {
                                    Text("Charging").foregroundStyle(.gray)
                                }
                            }
                        }
                        Text(sharedState.note)
                            .foregroundStyle(.gray)
                            .multilineTextAlignment(.center)
                    }
                }
            }.padding()
                .background(Color.black)
                .onTapGesture {
                    withAnimation {
                        showSettings = true
                    }
                    
                    timer?.invalidate()
                    timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
                        withAnimation {
                            showSettings = false
                        }
                    }
                }
                .gesture(DragGesture()
                    .onChanged { value in
                        let delta = Double(value.translation.height)
                        currentDelta = delta - previousDelta
                        if currentDelta <= 10 && currentDelta >= -10 {
                            currentDelta *= 100
                        }
                        let sensitivity: Double = 5000
                        let brightness = max(min(UIScreen.main.brightness - currentDelta / sensitivity, 1.0), 0.0)
                        
                        UIScreen.main.brightness = CGFloat(brightness)
                        
                        previousDelta = delta
                    }
                    .onEnded({ _ in
                        previousDelta = 0
                    })
                ).navigationDestination(for: SettingsNavigation.self, destination: { destination in
                    SettingsView()
                })
        }.statusBar(hidden: !statusBarState.showStatusBar)
            .persistentSystemOverlays(!statusBarState.showStatusBar ? .hidden : .visible)
            .environmentObject(sharedState)
            .environmentObject(fontState)
        
    }
    
    
    func getBatteryLevel() {
        batteryLevel = UIDevice.current.batteryLevel * 100
    }
}

#Preview {
    ContentView()
        .environmentObject(SharedState.init())
        .environmentObject(FontState.init())
        .environmentObject(StatusBarState.init())
}

struct SettingsNavigation: Hashable {}
