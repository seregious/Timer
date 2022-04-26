//
//  UserManager.swift
//  Timer
//
//  Created by Сергей Иванчихин on 25.04.2022.
//

import Combine

final class UserManager: ObservableObject {
    
    @Published var user = User()
    
    var isValid: Bool {
        switch user.name.count {
        case 0...2:
            return false
        default:
            return true
        }
    }
    
    init() {
        user = StorageManager.shared.loadUser()
    }
        
    init(user: User) {
        self.user = user
    }
}
