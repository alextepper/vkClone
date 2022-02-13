//
//  MockData.swift
//  FinalOne
//
//  Created by Alexander Tepper on 10/01/2022.
//

import UIKit

var usersData = [
    User(firstName: "Anton", lastName: "Golovin", username: "@antoha", profilePic: UIImage(named: "1")),
    User(firstName: "vasili", lastName: "Golovin", username: "@vasya", profilePic: UIImage(named: "2")),
    User(firstName: "papa", lastName: "Golovin", username: "@pahan", profilePic: UIImage(named: "3")),
    User(firstName: "sergey", lastName: "Golovin", username: "@sergey", profilePic: UIImage(named: "4")),
    User(firstName: "sergey", lastName: "Golovin", username: "@sergey", profilePic: UIImage(named: "4"))]

var postsData = [
    Post(postId: "1", postPicture: UIImage(named: "1")!, postOwner: usersData[1], postDate: Date()),
    Post(postId: "2", postPicture: UIImage(named: "2")!, postOwner: usersData[2], postDate: Date()),
    Post(postId: "3", postPicture: UIImage(named: "3")!, postOwner: usersData[3], postDate: Date()),
    Post(postId: "4", postPicture: UIImage(named: "4")!, postOwner: usersData[4], postDate: Date())
]
