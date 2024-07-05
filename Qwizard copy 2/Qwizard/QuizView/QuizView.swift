//
//  QuizView.swift
//  Qwizard
//
//  Created by nuca on 04.07.24.
//

import SwiftUI

struct QuizView: View {
    @State private var selectedOption: String? = nil
    @State private var timer: Int = 33
    @ObservedObject var viewModel: QuizViewModel
    
    var body: some View {
        VStack {
            timerAndWarningView
            
            ScrollView {
                questionView
                
                answersView
            }
            
            Spacer()
            
            continueButton
        }
        .padding()
        .navigationBarBackButtonHidden(true)
    }
    
    private var timerAndWarningView: some View {
        HStack {
            VStack {
                timeWarningView
                
                timerView
            }
            
            Image(systemName: "exclamationmark.triangle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(.red)
                .frame(width: 50)
        }
        .padding()
        .background(.gray.opacity(0.2))
        .clipShape(RoundedRectangle(cornerRadius: 25))
    }
    
    private var timeWarningView: some View {
        Text("Time left for the question:")
            .font(.subheadline)
    }
    
    private var timerView: some View {
        Text("\(timer) seconds")
            .font(.title)
            .onAppear(perform: startTimer)
            .fontWeight(.bold)
            .foregroundStyle(.red)
    }
    
    private var questionView: some View {
        Text(viewModel.questions[0].quest ?? "")
            .font(.headline)
            .padding()
    }
    
    private var answersView: some View {
        ForEach([viewModel.questions[0].answer1, viewModel.questions[0].answer2, viewModel.questions[0].answer3], id: \.self) { option in
            OptionView(option: option ?? "unavailable", selectedOption: $selectedOption)
        }
    }
    
    private var continueButton: some View {
        NavigationLink(
            destination: !viewModel.poppedQuestions().isEmpty ? AnyView(QuizView(questions: viewModel.poppedQuestions())) : AnyView(QuizCompletionView())
        ) {
            Text(viewModel.poppedQuestions().isEmpty ? "Finish" : "Continue")
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .font(.headline)
                .padding()
                .background((selectedOption == nil) ? Color.gray : Color.blue)
                .cornerRadius(8)
        }
        .disabled(selectedOption == nil)
    }
    
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if self.timer > 0 {
                self.timer -= 1
            } else {
                timer.invalidate()
            }
        }
    }

    init(questions: [Question]) {
        self.viewModel = QuizViewModel(questions: questions)
    }
}

//MARK: - Option View
struct OptionView: View {
    var option: String
    @Binding var selectedOption: String?
    
    var body: some View {
        HStack {
            Text(option)
            Spacer()
            if option == selectedOption {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.blue)
            }
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(8)
        .onTapGesture {
            selectedOption = option
        }
    }
}
