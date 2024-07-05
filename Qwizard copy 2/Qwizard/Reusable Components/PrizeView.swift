//
//  PrizeView.swift
//  Qwizard
//
//  Created by nuca on 04.07.24.
//

import SwiftUI

struct PrizeView: View {
    var sponsor: String
    var description: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(sponsor)
                    .font(.headline)
                Text(description)
                    .font(.subheadline)
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    PrizeView(sponsor: "df", description: "ff")
}
