//
//  DiscordInvitationView.swift
//  desk-fella
//
//  Created by Cem Ergin on 31/12/2023.
//

import SwiftUI

struct DiscordInvitationView: View {
    var body: some View {
        Link(
            destination: URL(
                string: Constants.URLs.discordInvitationUrl
            )!,
            label: {
                HStack {
                    Image(
                        uiImage: UIImage(
                            imageLiteralResourceName: Constants.Icons.discordIcon
                        )
                    )
                    .resizable()
                    .frame(
                        width: 24,
                        height: 24
                    )
                    Text(
                        "Discord"
                    ).padding(
                        .leading,
                        8
                    )
                }
            })
    }
}

#Preview {
    DiscordInvitationView()
}
