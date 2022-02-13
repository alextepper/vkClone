//
//  NetworkService.swift
//  FinalOne
//
//  Created by Alexander Tepper on 12/02/2022.
//

import Foundation
import Alamofire

final class NetworkService {

    let session =  URLSession.shared
            
    var urlConstructor: URLComponents = {
        var url = URLComponents()
        url.scheme = "https"
        url.host = "api.vk.com"
        
        return url
    }()
    
    func fetchData(userID: Int, token: String) {
        var constructor = urlConstructor
        constructor.path = "/method/users.get"
        constructor.queryItems = [
            URLQueryItem(name: "user_ids", value: String(userID)),
            URLQueryItem(name: "fields", value: "bdate"),
            URLQueryItem(name: "access_token", value: token),
            URLQueryItem(name: "v", value: "5.131")
            ]
        
        
        guard let url = constructor.url else { return }
        
        print(url)
        let task = session.dataTask(with: url) { (data, response, error) in
        let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
        print(json)
                }
                task.resume()
    }
    
    func getUserByIDAF(userID: String) {
        var constructor = urlConstructor
        constructor.path = "/method/users.get"
        guard let host = constructor.url else { return }
        let parameters: Parameters = [
            "user_ids": userID,
            "access_token": Session.instance.token,
            "v": "5.131",
            "fields": "photo_max_orig",
        ]
        AF.request(
            host,
            method: .get,
            parameters: parameters)
            .responseJSON { json in
                print(json)
            }
    }
    
    func getFriendsListAF(userID: Int) {
        var constructor = urlConstructor
        constructor.path = "/method/friends.get"
        guard let host = constructor.url else { return }
        let parameters: Parameters = [
            "user_ids": String(userID),
            "access_token": Session.instance.token,
            "v": "5.131",
        ]
        AF.request(
            host,
            method: .get,
            parameters: parameters)
            .responseJSON { json in
                print(json)
            }
    }
    
    func getUserPicsAF(userID: Int) {
        var constructor = urlConstructor
        constructor.path = "/method/photos.getAll"
        guard let host = constructor.url else { return }
        let parameters: Parameters = [
            "user_ids": String(userID),
            "access_token": Session.instance.token,
            "v": "5.131",
        ]
        AF.request(
            host,
            method: .get,
            parameters: parameters)
            .responseJSON { json in
                print(json)
            }
    }
    
    func getUserGroupsAF(userID: Int) {
        var constructor = urlConstructor
        constructor.path = "/method/groups.get"
        guard let host = constructor.url else { return }
        let parameters: Parameters = [
            "user_ids": String(userID),
            "access_token": Session.instance.token,
            "v": "5.131",
        ]
        AF.request(
            host,
            method: .get,
            parameters: parameters)
            .responseJSON { json in
                print(json)
            }
    }
    
    func searchGroupsByNameAF(searchRequest: String) {
        var constructor = urlConstructor
        constructor.path = "/method/groups.search"
        guard let host = constructor.url else { return }
        let parameters: Parameters = [
            "q": searchRequest,
            "access_token": Session.instance.token,
            "v": "5.131",
        ]
        AF.request(
            host,
            method: .get,
            parameters: parameters)
            .responseJSON { json in
                print(json)
            }
    }

}
