//
//  TimerApp.swift
//  Timer
//
//  Created by Сергей Иванчихин on 25.04.2022.
//

import SwiftUI

@main
struct TimerApp: App {
    
    @StateObject private var user = UserManager()
    
    var body: some Scene {
        WindowGroup {
            StarterView()
                .environmentObject(user)
        }
    }
}
