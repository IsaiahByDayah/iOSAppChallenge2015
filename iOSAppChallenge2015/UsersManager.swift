//
//  UsersManager.swift
//  iOSAppChallenge2015
//
//  Created by Isaiah Smith on 2/6/15.
//  Copyright (c) 2015 Isaiah Smith. All rights reserved.
//

import Foundation

class UsersManager {
    
    var users: [User] = []
    
    func addUser(username: String, password: String) -> User {
        let user = User(username: username, password: password)
        users.append(user)
        return user
    }
    
    func getUser(id: Int) -> User? {
        for user in users {
            if user.id == id {
                return user
            }
        }
        return nil
    }
    
}