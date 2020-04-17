//
//  SearchViewController.swift
//  VKapp
//
//  Created by Александр on 15.04.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var searchImage: UIImage!
    
    @IBOutlet weak var searchTextFieldLeading: NSLayoutConstraint!
    @IBOutlet weak var cancelButtonWIdth: NSLayoutConstraint!
    @IBOutlet weak var searchImageConstrait: NSLayoutConstraint!
    @IBOutlet weak var searchTextField: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        cancelButtonWIdth.constant = 0
        searchTextField.delegate = self
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        
        self.view.layoutIfNeeded()
        UIView.animate(withDuration: 0.25, animations: {
            self.cancelButtonWIdth.constant = 50
            self.view.layoutIfNeeded()
        })
        
        UIView.animate(withDuration: 1,
                       delay: 0,
                       usingSpringWithDamping: 0.7,
                       initialSpringVelocity: 0.3,
                       options: [],
                       animations: {
                        self.searchImageConstrait.constant = 70
                        self.view.layoutIfNeeded()
        })
    }
    
    @IBAction func cancelPressed(_ sender: UIButton) {
        self.view.layoutIfNeeded()
        UIView.animate(withDuration: 0.25, animations: {
            self.cancelButtonWIdth.constant = 0
            self.view.layoutIfNeeded()
        })
        
        UIView.animate(withDuration: 1,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0.3,
                       options: [],
                       animations: {
                        self.searchImageConstrait.constant = 200
                        self.view.layoutIfNeeded()
        })
        searchTextField.endEditing(true)
    }
}
