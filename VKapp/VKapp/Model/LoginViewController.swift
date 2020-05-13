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
}
    
    extension LoginViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment else {
            decisionHandler(.allow)
            return
        }
        let session = Session.instance
        
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
        
        session.token = params["access_token"]!
        decisionHandler(.cancel)
        performSegue(withIdentifier: "authSuccessed", sender: self)
    }
}
