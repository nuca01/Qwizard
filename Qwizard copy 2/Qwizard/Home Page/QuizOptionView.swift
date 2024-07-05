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
    @ObservedObject var usermanager: UserManager = UserManager.shared
    @State var timerStarted: Bool = false
    @State private var timer: Int
    
    
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
                    takeQuizButton(number: title.contains("Without") ? 1: 2)
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
        .onAppear {
            if !timerStarted {
                startTimer()
            }
        }
        
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
            timeAndDescriptionView(time: "\(viewModel.hours(timer: timer))", description: "Hours")
            
            timeAndDescriptionView(time: "\(viewModel.minutes(timer: timer))", description: "Minutes")
            
            timeAndDescriptionView(time: "\(viewModel.seconds(timer: timer))", description: "Seconds")
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
    
    private func takeQuizButton(number: Int) -> some View {
        NavigationLink {
            QuizView(questions: number == 1 ? viewModel.questions1: viewModel.questions2, correctAnswers: 0)
            
        } label: {
            Text("Take The Quiz")
                .foregroundColor(.black)
                .padding(.horizontal, 20)
                .padding(.vertical, 7)
                .background(usermanager.loggedIn ? Color.orange.opacity(0.8): .gray.opacity(0.15))
                .cornerRadius(12)
        }
        .disabled(!usermanager.loggedIn)
        .disabled(timer != 0)
        
    }
    
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if self.timer > 0 {
                self.timer -= 1
            } else {
                timer.invalidate()
            }
        }
        timerStarted = true
    }
    
    init(title: String, sponsors: [String], image: String, time: String) {
        self.title = title
        self.sponsors = sponsors
        self.image = image
        self.time = time
        self.timer = 61
        
        startTimer()
    }
}
