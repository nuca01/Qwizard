//
//  AuthorizationPageView.swift
//  Qwizard
//
//  Created by nuca on 04.07.24.
//

import SwiftUI

struct AuthorizationPageView: View {
    @Binding var userNotLoggedIn: Bool
    @State var isSignInPagePresented: Bool = false
    @State var isSignUpPagePresented: Bool = false
    
    var body: some View {
        VStack(alignment: .center) {
            imageView
                .foregroundStyle(.green)
            
            Text("log in to unlock prizes with your intellect!")
                .font(.system(size: 35))
                .multilineTextAlignment(.center)
                .padding()
            
            Text("sign up if you don't have an account yet")
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundStyle(.gray)
            
            buttonView(text: "log in", action: {
                isSignInPagePresented = true
            })
            .background(Color.blue)
            .cornerRadius(8)
            .padding()
            buttonView(text: "Sign Up", action: {
                isSignUpPagePresented = true
            })
            .background(.gray)
            .cornerRadius(8)
            .padding()
        }
        .navigationBarBackButtonHidden(true)
        .navigationDestination(isPresented: $isSignInPagePresented) {
            SignInPageView(userNotLoggedIn: $userNotLoggedIn, isSignInPagePresented: $isSignInPagePresented)
        }
        .navigationDestination(isPresented: $isSignUpPagePresented) {
            SignupPageView(userNotLoggedIn: $userNotLoggedIn, isSignUpPagePresented: $isSignUpPagePresented)
        }
    }
    
    private func buttonView(text: String, action: (() -> Void)? = nil) -> some View {
        Button(action: {
            if let action {
                action()
            }
        }) {
            Text(text)
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .font(.headline)
                .padding()
        }
    }
    
    private var imageView: some View {
        Image(systemName: "brain.head.profile")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 200)
    }
}
