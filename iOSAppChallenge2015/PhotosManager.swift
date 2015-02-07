//
//  PhotosManager.swift
//  iOSAppChallenge2015
//
//  Created by Isaiah Smith on 2/6/15.
//  Copyright (c) 2015 Isaiah Smith. All rights reserved.
//

import Foundation
import UIKit

class PhotosManager {
    
    var photos: [Photo] = []
    
    func getPhoto(id: Int) -> Photo? {
        for photo in photos {
            if photo.id == id {
                return photo
            }
        }
        return nil
    }
    
    func getPhotos(show: Show) -> [Photo] {
        var foundPhotos: [Photo] = []
        for photo in photos {
            // TODO
//            if photo.show.id == show.id {
//                foundPhotos.append(photo)
//            }
        }
        return foundPhotos
    }
    
    func getPhotos(user: User) -> [Photo] {
        var foundPhotos: [Photo] = []
        for photo in photos {
            if photo.user.id == user.id {
                foundPhotos.append(photo)
            }
        }
        return foundPhotos
    }
    
    func addPhoto(user: User, show: Show, source: UIImage) -> Photo {
        let photo = Photo(user: user, show: show, source: source)
        photos.append(photo)
        return photo
    }
    
}