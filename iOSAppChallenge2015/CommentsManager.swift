//
//  CommentsManager.swift
//  iOSAppChallenge2015
//
//  Created by Isaiah Smith on 2/6/15.
//  Copyright (c) 2015 Isaiah Smith. All rights reserved.
//

import Foundation

class CommentsManager {
    
    var comments: [Comment] = []
    
    func getComment(id: Int) -> Comment? {
        for comment in comments{
            if comment.id == id{
                return comment
            }
        }
        return nil
    }
    
    func getShowComments(show: Show) -> [Comment] {
        for showComments in comments{
            if showComments.shows.id == show.id{
                return comments
            }
        }
        return nil
    }
    
    func getUserComments(user: User) -> [Comment] {
        for userComments in comments{
            if userComments.user.id == user.id{
                return userComments
            }
        }
        return nil
    }
    
    func addComment(text: String, forUser: User, forShow: Show) -> Comment {
        var newComment = Comment(text: text, user: forUser, shows: forShow)
        comments.append(newComment)
        return newComment
    }
}