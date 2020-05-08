//
//  ViewController.swift
//  VKapp
//
//  Created by Александр on 23.03.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit
import WebKit
import Alamofire

class LoginViewController: UIViewController {
    
    @IBOutlet weak var webView2: WKWebView!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        webView2.navigationDelegate = self
        webView2.load(ApiWrapper.authRequest)
    }
    
    
    func getGroups() {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.vk.com"
        components.path = "/method/groups.get"
        components.queryItems = [
            URLQueryItem(name: "user_ids", value: "2718669"),
            URLQueryItem(name: "access_token", value: ApiWrapper.token),
            URLQueryItem(name: "extended", value: "1"),
            URLQueryItem(name: "v", value: "5.68")
        ]
    
        AF.request(components.url!).responseJSON { response in
               
            guard let data = response.value else { return }
                
                do {
                    let users = try JSONDecoder().decode([Groups].self, from: data as! Data)
                    print(users)
                } catch {
                    print(error)
                }
            }
    }
}
    
    extension LoginViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment else {
            decisionHandler(.allow)
            return
        }
        
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
        }
        
        ApiWrapper.token = params["access_token"]!
        decisionHandler(.cancel)
        getGroups()
        
//        performSegue(withIdentifier: "authSuccessed", sender: self)
    }
}
