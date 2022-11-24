//
//  ViewController.swift
//  Vira
//
//  Created by Alex Fount on 21.11.22.
//

import UIKit

protocol AnyView: AnyObject {
    var presenter: AnyPresenter? { get set }
    
    func updateView(with: [Game])
    func updateView(with: String)
}

class MainView: UIViewController, AnyView {
    
    var presenter: AnyPresenter?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // view.backgroundColor = .lightGray
        
        
    }
    
    func updateView(with: [Game]) {
        view.backgroundColor = .systemBlue
    }
    
    func updateView(with: String) {
        view.backgroundColor = .systemRed
    }
//    func exitButtonAction() {
//        presenter?.userTappedButton()
//    }
    
}

