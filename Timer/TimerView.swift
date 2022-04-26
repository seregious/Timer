//
//  ContentView.swift
//  Timer
//
//  Created by Сергей Иванчихин on 25.04.2022.
//

import SwiftUI

struct TimerView: View {
    
    @StateObject var timer = TimeCounter()
    @EnvironmentObject private var userManager: UserManager
    
    var body: some View {
        VStack {
            Text("Hi, \(userManager.user.name)")
                .font(.largeTitle)
                .padding()
        Text(String(timer.counter))
            .padding(.top, 100)
            .font(.largeTitle)
        Spacer()
            StartButton(timer: timer)
        Spacer()
            LogOutButton(userManager: userManager)

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}

struct StartButton: View {
    
    @ObservedObject var timer: TimeCounter
    
    var body: some View {
        Button {
            timer.startTimer()
        } label: {
            Text(timer.buttonTitle)
                .modifier(buttonColor(color: .blue))
        }
    }
}

struct LogOutButton: View {
    
    @ObservedObject var userManager: UserManager
    
    var body: some View {
        Button {
            logOut()
        } label: {
            Text("Log out")
                .modifier(buttonColor(color: .red))
        }
    }
    func logOut() {
        StorageManager.shared.deleteName(userManager: userManager)
    }
    
}

struct buttonColor: ViewModifier {
    let color: Color
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .padding()
            .padding(.horizontal, 60)
            .foregroundColor(.white)
            .background(color)
            .cornerRadius(25)
            .overlay(
            RoundedRectangle(cornerRadius: 25)
                .stroke(.mint, lineWidth: 5)
            )
    }
}
