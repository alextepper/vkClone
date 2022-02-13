//
//  VKLoginViewController.swift
//  FinalOne
//
//  Created by Alexander Tepper on 12/02/2022.
//

import UIKit
import WebKit

class VKLoginViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView! {
        didSet {
            webView.navigationDelegate = self
        }
    }
    
    private let networkService = NetworkService()
    
    private var urlComponents: URLComponents = {
        var comp = URLComponents()
        comp.scheme = "https"
        comp.host = "oauth.vk.com"
        comp.path = "/authorize"
        comp.queryItems = [
            URLQueryItem(name: "client_id", value: "8019364"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "336918"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.131")
        ]
        return comp
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard
            let url = urlComponents.url
        else { return }
        
        webView.load(URLRequest(url: url))
    }
    
}

extension VKLoginViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard
            let url = navigationResponse.response.url,
            url.path == "/blank.html",
            let fragment = url.fragment
        else { return decisionHandler(.allow) }
        
        let parameters = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { partialResult, params in
                var dict = partialResult
                let key = params[0]
                let value = params[1]
                dict[key] = value
                return dict
            }
        guard
            let token = parameters["access_token"],
            let userIDString = parameters["user_id"],
            let userID = Int(userIDString)
        else { return decisionHandler(.allow) }
        
        Session.instance.token = token
        Session.instance.userID = userID
        
        performSegue(withIdentifier: "fromLoginToAppSegue", sender: nil)
        networkService.getUserByIDAF(userID: String(userID))
        // Задание 6 - получение списка друзей
        networkService.getFriendsListAF(userID: userID)
        // Задание 7 - получение фотографий человека по ID
        networkService.getUserPicsAF(userID: userID)
        // Задание 8 - получение групп пользователя по ID
        networkService.getUserGroupsAF(userID: userID)
        // Задание 9 - получение групп по поисковому запросу
        networkService.searchGroupsByNameAF(searchRequest: "mars")
        decisionHandler(.cancel)
    }
}
