//
//  TextClockView.swift
//  desk-fella
//
//  Created by Cem Ergin on 01/01/2024.
//

import SwiftUI

struct TextClockView: View {
    @EnvironmentObject private var displayViewModel: DisplayViewModel
    @EnvironmentObject private var homeViewModel: HomeViewModel
    @EnvironmentObject private var fontViewModel: FontViewModel
    
    var body: some View {
        Text(homeViewModel.dateFormatter.hour(showHour: displayViewModel.showHour, showMinute: displayViewModel.showMinute, showSeconds: displayViewModel.showSeconds).string(from: homeViewModel.currentDate)).foregroundStyle(.gray).font(.custom(fontViewModel.font, size: 72)).onAppear {
            let _ = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                homeViewModel.currentDate = Date()
            }
        }
    }
}

#Preview {
    TextClockView()
        .environmentObject(DisplayViewModel())
        .environmentObject(HomeViewModel())
        .environmentObject(FontViewModel())
}
