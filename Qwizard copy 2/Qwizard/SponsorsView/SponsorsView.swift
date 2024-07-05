//
//  SponsorsView.swift
//  Qwizard
//
//  Created by nuca on 04.07.24.
//

import SwiftUI

struct SponsorsView: View {
    var body: some View {
        VStack {
            titleView
            
            sponsorsListView
        }
    }
    
    private var titleView: some View {
        Text("Sponsors")
            .font(.largeTitle)
            .padding()
    }
    
    private var sponsorsListView: some View {
        List {
            
            VStack {
                HStack {
                    PrizeView(sponsor: "Spotify", description: "10% discount on 1 year premium")
                    
                    Image("unavailable-image")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                }
                
                
                HStack {
                    Spacer()
                    
                    Text("top 100")
                        .font(.subheadline)
                        .foregroundColor(.red)
                }
            }
            
            VStack {
                HStack {
                    PrizeView(sponsor: "Spotify", description: "10% discount on 1 year premium")
                    
                    Image("unavailable-image")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                }
                
                HStack {
                    Spacer()
                    
                    Text("top 100")
                        .font(.subheadline)
                        .foregroundColor(.red)
                }
            }
            
            VStack {
                HStack {
                    PrizeView(sponsor: "Spotify", description: "10% discount on 1 year premium")
                    
                    Image("unavailable-image")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                }
                
                HStack {
                    Spacer()
                    
                    Text("top 100")
                        .font(.subheadline)
                        .foregroundColor(.red)
                }
            }
        }
    }
}

#Preview {
    SponsorsView()
}
