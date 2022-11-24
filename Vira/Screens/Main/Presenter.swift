//
//  Presenter.swift
//  Vira
//
//  Created by Alex Fount on 21.11.22.
//

import Foundation

protocol AnyPresenter: AnyObject {
    var view: AnyView? { get set  }
    var interactor: AnyInteractor? { get set  }
    var router: AnyRouter? { get set  }
    
    func interactorDidFetchGames(with result: Result<[Game], Error>)
    
   // func userTappedButton()
}

class MainPresenter: AnyPresenter {

    
    weak var view: AnyView?
    var router: AnyRouter?
    
    var interactor: AnyInteractor? { // можно во ViewDidLoad вызывать функцию fetch
        didSet {
            interactor?.fetchGames()
        }
    }
        
    
    func interactorDidFetchGames(with result: Result<[Game], Error>) {
        switch result {
        case .success(let result):
            view?.updateView(with: result)
        case .failure(let error):
            view?.updateView(with: error.localizedDescription)
            
        }

    }
//    func userTappedButton() {
//        print("UserTapped")
//    }
    
}
