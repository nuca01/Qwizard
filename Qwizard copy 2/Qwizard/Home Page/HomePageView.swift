//
//  HomePageView.swift
//  Qwizard
//
//  Created by nuca on 04.07.24.
//

import SwiftUI

struct HomePageView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Choose a quiz")
                        .font(.largeTitle)
                        .padding()
                    
                    QuizOptionView(title: "Quiz Without Visible Ranking", sponsors: ["KFC", "Amazon"], image: "KFC", time: "00:05:00")
                    
                    QuizOptionView(
                        title: "Quiz With Visible Ranking",
                        sponsors: ["Burger King", "Walmart"], 
                        image: "Burger-King",
                        time: "00:05:00"                    )
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}
#Preview {
    HomePageView()
}
