//
//  Session.swift
//  FinalOne
//
//  Created by Alexander Tepper on 08/02/2022.
//

final class Session {
    var token: String = ""
    var userID: Int = 0
    
    static let instance = Session()
    
    private init() { }
}
