//
//  SignupPageView.swift
//  Qwizard
//
//  Created by nuca on 04.07.24.
//

import SwiftUI

struct SignupPageView: View {
    @State private var userName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @Binding var userNotLoggedIn: Bool
    @Binding var isSignUpPagePresented: Bool
    @StateObject var viewModel: SignUpPageViewModel = SignUpPageViewModel()
    
    private var someFieldIsEmpty: Bool {
        userName.isEmpty || email.isEmpty || password.isEmpty
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Enter your information:")
                    .padding()
                
                fieldView(text: "username", field: $userName)
                
                fieldView(text: "email", field: $email)
                
                fieldView(text: "password", field: $password)
                
                Button(action: {
                    viewModel.user?.userName = userName
                    viewModel.user?.email = email
                    viewModel.user?.password = password
                    isSignUpPagePresented = false
                    userNotLoggedIn = false
                    User.loggedIn = true
                }) {
                    Text("finish signing up")
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding()
                        .background(someFieldIsEmpty ? .gray: Color.blue)
                        .cornerRadius(8)
                    
                }
                .padding()
                .disabled(someFieldIsEmpty)
                
                if someFieldIsEmpty {
                    Text("Every field must be filled")
                        .foregroundStyle(.red)
                }
            }
        }
    }
    
    private func fieldView(text: String, field: Binding<String>) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            fieldDescription(with: text)
            
            textField(text: text, for: field)
        }
    }
    
    private func fieldDescription(with text: String) -> some View {
        Text(text)
            .padding(.horizontal)
            .foregroundStyle(.black.opacity(0.7))
    }
    
    private func textField(text: String, for field: Binding<String>) -> some View {
        TextField("enter your \(text)", text: field)
            .padding()
            .background(Color.gray.opacity(0.15))
            .clipShape(RoundedRectangle(cornerRadius: 10.0))
            .padding()
    }
}
