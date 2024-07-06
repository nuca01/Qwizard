//
//  ProfilePageView.swift
//  Qwizard
//
//  Created by nuca on 05.07.24.
//

import SwiftUI

struct ProfilePageView: View {
    @StateObject private var viewModel = ProfilePageViewModel()
    @State private var userNotLoggedIn: Bool = true
    @ObservedObject private var userManager: UserManager = UserManager.shared
    
    var body: some View {
        NavigationStack {
            VStack {
                nameView
                
                scoreView
                
                rankingView
                
                Spacer()
                    .frame(height: 30)
                
                offersTitleView
                
                Spacer()
                
                sponsorsListView
            }
            .onChange(of: viewModel.userNotLoggedIn) {
                userNotLoggedIn = viewModel.userNotLoggedIn
            }
            .navigationDestination(isPresented: $userNotLoggedIn) {
                AuthorizationPageView(userNotLoggedIn: $userNotLoggedIn)
            }
        }
    }
    
    private var nameView: some View {
        Text(viewModel.user?.userName ?? "username unavailable")
            .font(.largeTitle)
            .frame(width: 300)
            .multilineTextAlignment(.center)
    }
    
    private var scoreView: some View {
        Text("score: \(userManager.score)")
            .foregroundStyle(.green)
            .font(.system(size: 20))
            .fontWeight(.bold)
    }
    
    private var rankingView: some View {
        Text("ranking: \(viewModel.ranking ?? "unavailable")")
            .foregroundStyle(.orange)
            .font(.system(size: 15))
            .fontWeight(.bold)
    }
    
    private var offersTitleView: some View {
        Text("visible offers:")
            .font(.system(size: 20))
            .fontWeight(.bold)
    }
    
    private var sponsorsListView: some View {
        List {
            VStack {
                HStack {
                    PrizeView(sponsor: "Spotify", description: "10% discount on 1 year premium")
                    
                    Image("spotify")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                }
            }
        }
    }
}

#Preview {
    ProfilePageView()
}
