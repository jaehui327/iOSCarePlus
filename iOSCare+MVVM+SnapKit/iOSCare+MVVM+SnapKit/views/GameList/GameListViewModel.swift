//
//  GameListViewModel.swift
//  iOSCare+MVVM+SnapKit
//
//  Created by 김재희 on 2021/02/23.
//

import Alamofire
import Foundation

class GameListViewModel {
    // MARK: - properties
    var model: NewGameModel?
    var isEnd: Bool = false
    
    // MARK: - Initializer
    
    // MARK: - Methods
    private func gameListApiCall(url: String, completion: @escaping (NewGameModel) -> Void) {
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   encoding: JSONEncoding.default,
                   headers: nil).responseData { dataResponse in
                switch dataResponse.result {
                case .success(let data):
                    do {
                        let gameModel: NewGameModel = try JSONDecoder().decode(NewGameModel.self, from: data)
                        completion(gameModel)
                    } catch {
                        print("Got and error: \(error)")
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
        }
    }
    
    func setViewModel(url: String, completion: @escaping() -> Void) {
        self.gameListApiCall(url: url) { gameModel in
            self.model = gameModel
            completion()
        }
    }
}
