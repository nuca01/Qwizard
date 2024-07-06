//
//  SponsorsView.swift
//  Qwizard
//
//  Created by nuca on 04.07.24.
//

import SwiftUI

struct SponsorsView: View {
    var isFirstQuiz: Bool
    
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
                    PrizeView(sponsor: isFirstQuiz ? "Amazon": "Walmart", description: "10% discount on everything")
                    
                    Image(isFirstQuiz ? "amazon": "walmart")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                }
                
                
                HStack {
                    Spacer()
                    
                    Text("top 300")
                        .font(.subheadline)
                        .foregroundColor(.red)
                }
            }
            
            VStack {
                HStack {
                    PrizeView(sponsor: isFirstQuiz ? "KFC": "Burger King", description: "20% discount on every burger")
                    
                    Image(isFirstQuiz ? "KFC": "Burger-King")
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
