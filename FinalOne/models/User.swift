//
//  User.swift
//  FinalOne
//
//  Created by Alexander Tepper on 06/01/2022.
//

import Foundation
import UIKit

struct User {
    var firstName: String
    var lastName: String
    var username: String
    var profilePic: UIImage?
    var followersIDs = Set<String>()
    var posts = [Post]()
    var followingIDs = Set<String>()
    var profileDescription: String?
}
