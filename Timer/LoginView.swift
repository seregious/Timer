//
//  LoginView.swift
//  Timer
//
//  Created by Сергей Иванчихин on 25.04.2022.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject private var userManager: UserManager
    var userName: String {
        userManager.user.name
    }
        
    var color: Color {
        userManager.isValid ? .green : .red
    }
    
    var body: some View {
        VStack {
            
            HStack {
                TextField("Enter your name", text: $userManager.user.name)
                .multilineTextAlignment(.center)
                Text("\(userName.count)")
                    .foregroundColor(color)
                    .padding(.trailing, 10)
            }
            Button {
                save()
            } label: {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
                .disabled(!userManager.isValid)
            }
            
        }
    }
    
    func save() {
        userManager.user.isRegistered = true
        StorageManager.shared.saveName(for: userManager.user)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
