//
//  ViewController.swift
//  VKapp
//
//  Created by Александр on 23.03.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var vkLabel: UILabel!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var scrollBotConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vkLabel.text = "VK"
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWasShown(notification:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillBeHidden(notification:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        switch identifier {
        case "loginSegue":
            let auth = login()
            return auth
        default:
            return false
        }
    }
    
    func login() -> Bool {
        let login = loginTextField.text!
        let password = passwordTextField.text!
        
        switch (login, password) {
        case ("admin", "123456"):
            return true
        case ("admin", _):
            passwordError()
            return false
        default:
            loginError()
            return false
        }
    }
    
    func loginError() {
        
        let alert = UIAlertController(
            title: "Ошибка",
            message: "Неверные имя пользователя или пароль",
            preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    func passwordError() {
        
        let alert = UIAlertController(
            title: "Ошибка",
            message: "Неверный пароль",
            preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    @objc func keyboardWasShown(notification: Notification) {
        let userInfo = (notification as NSNotification).userInfo as! [String: Any]
        let frame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
        
        scrollBotConstraint.constant = frame.height
    }
    
    @objc func keyboardWillBeHidden(notification: Notification) {
        scrollBotConstraint.constant = 0
    }
    
}

