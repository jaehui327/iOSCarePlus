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
    private var getNewGameListURL: String {
        "https://ec.nintendo.com/api/KR/ko/search/new?count=\(count)&offset=\(offset)"
    }
    
    private var getSaleGameListURL: String {
        "https://ec.nintendo.com/api/KR/ko/search/sales?count=\(count)&offset=\(offset)"
    }
    
    var model: NewGameModel?
    
    private var count: Int = 10
    private var offset: Int = 0
    private var isEnd: Bool = false
    
    // MARK: - Initializer
    init() {
        gameListApiCall(url: getNewGameListURL)
    }
    
    // MARK: - Methods
    private func gameListApiCall(url: String) {
        AF.request(url).responseJSON { [weak self] response in
            guard let self = self else { return }
            guard let data = response.data else { return }
            
            let decoder: JSONDecoder = JSONDecoder()
            guard let newModel: NewGameModel = try? decoder.decode(NewGameModel.self, from: data) else {
                return
            }
            
            if newModel.contents.isEmpty {
                self.isEnd = true
            }
            self.model?.contents.append(contentsOf: newModel.contents)
        }
    }
}
