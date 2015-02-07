//
//  UsersManager.swift
//  iOSAppChallenge2015
//
//  Created by Isaiah Smith on 2/6/15.
//  Copyright (c) 2015 Isaiah Smith. All rights reserved.
//

import Foundation
import UIKit

class UsersManager {
    
    var users: [User] = []
    
    var currentUser: User? = nil
    
    func addUser(username: String, password: String, profilePic: UIImage) -> User {
        let user = User(username: username, password: password, profilePic: profilePic)
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
    
    func getUser(username: String) -> User? {
        for user in users {
            if user.username == username {
                return user
            }
        }
        return nil
    }
    
    func loginUser(username: String, password: String) -> User? {
        if let user = getUser(username) {
            if user.password == password {
                currentUser = user
                return currentUser
            }
        }
        return nil
    }
}