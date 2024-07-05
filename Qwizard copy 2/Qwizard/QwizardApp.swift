//
//  QwizardApp.swift
//  Qwizard
//
//  Created by nuca on 04.07.24.
//

import SwiftUI

@main
struct QwizardApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                HomePageView()
                    .tabItem {
                        Label("Home", systemImage: "list.dash")
                    }
                ProfilePageView()
                    .tabItem {
                        Label("Profile", systemImage: "list.dash")
                    }
            }
        }
    }
}
