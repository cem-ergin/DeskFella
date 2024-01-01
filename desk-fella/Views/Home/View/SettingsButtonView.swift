//
//  SettingsButtonView.swift
//  desk-fella
//
//  Created by Cem Ergin on 01/01/2024.
//

import SwiftUI

struct SettingsButtonView: View {
    @EnvironmentObject private var homeViewModel: HomeViewModel
    
    var body: some View {
        VStack{
            HStack {
                Spacer()
                if homeViewModel.showSettings {
                    withAnimation {
                        Button(action: {
                            withAnimation {
                                homeViewModel.showSettings = false
                            }
                            
                            homeViewModel.path.append(SettingsNavigation())
                        }, label: {
                            Label("Settings", systemImage: "gear")
                        })
                    }
                }
            }
            Spacer()
        }
    }
}

#Preview {
    SettingsButtonView()
        .environmentObject(HomeViewModel())
}
