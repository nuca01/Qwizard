//
//  QuizCompletionView.swift
//  Qwizard
//
//  Created by nuca on 04.07.24.
//

import SwiftUI

struct QuizCompletionView: View {
    var correctAnswers: Int
    
    var body: some View {
        VStack {
            imageView
            
            messageView
            
            statisticsView
            
            continueButton
        }
        .navigationBarBackButtonHidden(true)
    }
    
    private var imageView: some View {
        Image(systemName: "fireworks")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 200)
    }
    
    private var messageView: some View {
        Text("Quiz complete!")
            .font(.largeTitle)
            .padding()
    }
    
    private var statisticsView: some View {
        HStack(spacing: 20) {
            statisticView(value: "\(correctAnswers)", description: "total Score")
            
//            statisticView(value: "1:44", description: "Speed")
//            
//            statisticView(value: "100%", description: "Perfection")
            
        }
    }
    
    private var continueButton: some View {
        NavigationLink(
            destination: YourAwardsPageView()
        ) {
            Text("Continue")
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
                .cornerRadius(8)
        }
    }
    
    private func statisticView(value: String, description: String) -> some View {
        VStack {
            Text(value)
            Text(description)
        }
    }
}
