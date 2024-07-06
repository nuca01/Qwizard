//
//  YourAwardsPageView.swift
//  Qwizard
//
//  Created by nuca on 05.07.24.
//

//import SwiftUI
//
//struct YourAwardsPageView: View {
//    @StateObject private var viewModel = ProfilePageViewModel()
//    
//    var body: some View {
//        NavigationStack {
//            VStack {
//                sponsorsListView
//                
//                continueButton
//                    .padding()
//            }
//        }
//        .navigationTitle("Awards Unlocked")
//        .navigationBarBackButtonHidden(true)
//    }
//    
//    private var sponsorsListView: some View {
//        List {
//            VStack {
//                HStack {
//                    PrizeView(sponsor: "Amazon", description: "10% discount on 1 year premium")
//                    
//                    Image("Amazon")
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 100)
//                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
//                }
//            }
//        }
//    }
//    
//    private var continueButton: some View {
//        NavigationLink {
//            HomePageView()
//        } label: {
//            Text("Continue")
//                .frame(maxWidth: .infinity)
//                .foregroundColor(.white)
//                .font(.headline)
//                .padding()
//                .background(Color.blue)
//                .cornerRadius(8)
//        }
//    }
//}
//
//#Preview {
//    YourAwardsPageView()
//}
