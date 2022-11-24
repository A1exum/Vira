//
//  Router.swift
//  Vira
//
//  Created by Alex Fount on 21.11.22.
//

import UIKit

typealias EntryPoint = UIViewController & AnyView

protocol AnyRouter: AnyObject{
    var entryPoint: EntryPoint? { get set }
    
    static func build() -> AnyRouter
}

class MainRouter: AnyRouter {
    
    var entryPoint: EntryPoint?
    
    static func build() -> AnyRouter {
        
        let router: AnyRouter = MainRouter()
        let view: AnyView = MainView()
        let presenter: AnyPresenter = MainPresenter()
        let interactor: AnyInteractor = MainInterractor()
        
        //entryPoint = view
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        router.entryPoint = view as? EntryPoint
        
        return router
        
        
        
    }
    
    
    
}
