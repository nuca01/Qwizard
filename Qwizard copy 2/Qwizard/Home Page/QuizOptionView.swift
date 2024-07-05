//
//  QuizOptionView.swift
//  Qwizard
//
//  Created by nuca on 04.07.24.
//

import SwiftUI

struct QuizOptionView: View {
    var title: String
    var sponsors: [String]
    var image: String
    var time: String
    var viewModel = QuizOptionViewModel()
    
    private var description: String {
        title.contains("Without") ? "In case you take this quiz you won’t be able to see your ranking before purchasing an item. You will still be able to see your score to estimate whether you’re eligible to receive the prize. " : "In case you take this quiz you’ll be able to see your ranking right away."
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            titleView
            
            descriptionView
            
            timerView
            
            HStack {
                VStack(alignment: .leading) {
                    sponsorsView
                    takeQuizButton
                }
                
                Spacer()
                
                imageView
            }
        }
        .padding()
        .background(.white)
        .cornerRadius(12)
        .padding(.horizontal)
        .shadow(color: .gray.opacity(0.4), radius: 3)
        
    }
    
    private var titleView: some View {
        Text(title)
            .font(.headline)
            .padding(.top)
            .frame(
                maxWidth: .infinity,
                alignment: .leading
            )
    }
    
    private var descriptionView: some View {
        Text(description)
            .font(.subheadline)
            .padding(.bottom)
    }
    
    private var timerView: some View {
        HStack(spacing: 10) {
            timeAndDescriptionView(time: "00", description: "Hours")
            
            timeAndDescriptionView(time: "05", description: "Minutes")
            
            timeAndDescriptionView(time: "55", description: "Seconds")
        }
        .frame(
            maxWidth: .infinity
        )
    }
    
    private var sponsorsView: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Sponsored by:")
                .font(.subheadline)
                .foregroundStyle(.gray)
            
            Text("\(sponsors.joined(separator: ", "))")
            
            prizesViewButton
        }
    }
    
    private var prizesViewButton: some View {
        NavigationLink(destination: SponsorsView()) {
            Text("See Prizes")
                .font(.subheadline)
                .foregroundStyle(.blue)
                .underline()
        }
        .padding(.bottom)
    }
    
    private var imageView: some View {
        Image(image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 150)
            .clipShape(RoundedRectangle(cornerRadius: 25.0))
    }
    
    private var takeQuizButton: some View {
        NavigationLink {
            QuizView(questions: viewModel.questions)
        } label: {
            Text("Take The Quiz")
                .foregroundColor(.black)
                .padding(.horizontal, 20)
                .padding(.vertical, 7)
                .background(Color.orange.opacity(0.8))
                .cornerRadius(12)
        }
        .disabled(!User.loggedIn)
    }
    
    private func timeView(with time: String) -> some View {
        Text(time)
            .padding()
            .frame(
                maxWidth: .infinity
            )
            .background(.green.opacity(0.15))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .foregroundStyle(.black)
    }
    
    private func timeDescriptionView(with description: String) -> some View {
        Text(description)
            .fontWeight(.thin)
    }
    
    private func timeAndDescriptionView(time: String, description: String) -> some View {
        VStack {
            timeView(with: time)
            
            timeDescriptionView(with: description)
        }
    }
}
