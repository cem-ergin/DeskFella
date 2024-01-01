//
//  DateView.swift
//  desk-fella
//
//  Created by Cem Ergin on 01/01/2024.
//

import SwiftUI

struct DateView: View {
    @EnvironmentObject private var homeViewModel: HomeViewModel
    @EnvironmentObject private var fontViewModel: FontViewModel
    
    var body: some View {
        Text(homeViewModel.dateFormatter.MMMMdd().string(from: homeViewModel.currentDate)).foregroundStyle(.gray).font(.custom(fontViewModel.font, size: 24))
    }
}

#Preview {
    DateView()
        .environmentObject(HomeViewModel())
        .environmentObject(FontViewModel())
}
