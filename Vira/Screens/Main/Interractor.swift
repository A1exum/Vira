//
//  Interactor.swift
//  Vira
//
//  Created by Alex Fount on 21.11.22.
//

import Foundation
enum ParsingError: Error {
    case overflow(String)
    case invalidInput(String)
    
}

protocol AnyInteractor: AnyObject {
    var presenter: AnyPresenter? { get set }
    
    func fetchGames()
}

class MainInterractor: AnyInteractor {
    
    weak var presenter: AnyPresenter?
    
    func fetchGames() {
        
        let random = Int.random(in: 1...100)
        
        let entity = [Game(name: "Raz"), Game(name: "Dva"), Game(name: "Tre"), Game(name: "Chatire")]
        
        //        DispatchQueue.main.async {
        //            sleep(3)
        //            self.presenter?.interactorDidFetchGames(with: .success(entity))
        //
        //        }
        DispatchQueue.main.async{
            if random % 2 == 0 {
                self.presenter?.interactorDidFetchGames(with: .success(entity))
            }
            else {
                    let error = ParsingError.invalidInput("Total errora")
                    self.presenter?.interactorDidFetchGames(with: .failure(error))
            }
        }
    }
}
