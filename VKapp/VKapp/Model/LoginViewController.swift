//
//  ViewController.swift
//  VKapp
//
//  Created by Александр on 23.03.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit
import WebKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var webView2: WKWebView!

    

    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView2.load(ApiWrapper.authRequest)
        

//        NotificationCenter.default.addObserver(
//            self,
//            selector: #selector(keyboardWasShown(notification:)),
//            name: UIResponder.keyboardWillShowNotification,
//            object: nil)
//        NotificationCenter.default.addObserver(
//            self,
//            selector: #selector(keyboardWillBeHidden(notification:)),
//            name: UIResponder.keyboardWillHideNotification,
//            object: nil)
    }
    

//    @objc func keyboardWasShown(notification: Notification) {
//        let userInfo = (notification as NSNotification).userInfo as! [String: Any]
//        let frame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
//
//        scrollBotConstraint.constant = frame.height
//    }
//
//    @objc func keyboardWillBeHidden(notification: Notification) {
//        scrollBotConstraint.constant = 0
//    }
//
}

