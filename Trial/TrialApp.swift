//
//  TrialApp.swift
//  Trial
//
//  Created by Jatin Madan on 1/8/24.
//

import SwiftUI

@main
struct TrialApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }.immersionStyle(selection: .constant(.full), in: .full)
    }
}
