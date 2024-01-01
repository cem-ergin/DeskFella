//
//  NoteView.swift
//  desk-fella
//
//  Created by Cem Ergin on 01/01/2024.
//

import SwiftUI

struct NoteView: View {
    @EnvironmentObject var displayViewModel: DisplayViewModel
    
    var body: some View {
        Text(displayViewModel.note)
            .foregroundStyle(.gray)
            .multilineTextAlignment(.center)
    }
}

#Preview {
    NoteView()
        .environmentObject(DisplayViewModel())
}
