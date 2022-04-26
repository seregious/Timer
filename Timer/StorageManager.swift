//
//  StorageManager.swift
//  Timer
//
//  Created by Сергей Иванчихин on 25.04.2022.
//

import Foundation
import SwiftUI

final class StorageManager {
    
    static var shared = StorageManager()
    
    @AppStorage("name") private var userData: Data?
    
    
    func saveName(for user: User){
        userData = try? JSONEncoder().encode(user)
    }
    
    func deleteName(userManager: UserManager) {
        userManager.user.name = ""
        userManager.user.isRegistered = false
        userData = nil
    }
    
    func loadUser() -> User {
        guard let user = try? JSONDecoder().decode(User.self, from: userData ?? Data()) else {return User()}
        return user
    }
    
    private init() {}
}
