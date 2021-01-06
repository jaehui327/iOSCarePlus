//
//  GameListViewController.swift
//  iOSCarePlus
//
//  Created by JHKim on 2021/01/06.
//

import Alamofire
import UIKit

class GameListViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - properties
    private var getNewGameListURL: String {
        "https://ec.nintendo.com/api/KR/ko/search/new?count=\(newCount)&offset=\(newOffset)"
    }
    private var newCount: Int = 10
    private var newOffset: Int = 0
    private var isEnd: Bool = false
    private var model: NewGameResponse? {
        didSet {
            tableView.reloadData()
        }
    }
    
    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tableView.register(GameItemCodeTableViewCell.self, forCellReuseIdentifier: "GameItemCodeTableViewCell")
        newGameListApiCall()
    }

    private func newGameListApiCall() {
        AF.request(getNewGameListURL).responseJSON { [weak self] response in
            guard let data = response.data else { return }
            
            let decoder: JSONDecoder = JSONDecoder()
            guard let newModel: NewGameResponse = try? decoder.decode(NewGameResponse.self, from: data) else {
                return
            }
            
            if self?.model == nil {
                self?.model = newModel
            } else {
                if newModel.contents.isEmpty {
                    self?.isEnd = true
                }
                self?.model?.contents.append(contentsOf: newModel.contents)
            }
        }
    }
}

// MARK: - UITableVIewDelegate
extension GameListViewController: UITableViewDelegate {
}

// MARK: - UITableViewDataSource
extension GameListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isEnd {
           return (model?.contents.count ?? 0)
        }
        return (model?.contents.count ?? 0) + 1
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if isIndicatorCell(indexPath) {
            newOffset += 10
            newGameListApiCall()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // let cell = tableView.dequeueReusableCell(withIdentifier: "GameItemCodeTableViewCell", for: indexPath)
        // return cell
        
        if isIndicatorCell(indexPath) {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "IndicatorCell", for: indexPath) as? IndicatorCell else { return UITableViewCell() }
            cell.animationIndicatorView()
            return cell
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GameItemTableViewCell", for: indexPath) as? GameItemTableViewCell, let content = model?.contents[indexPath.row] else { return UITableViewCell() }
        
        let model: GameItemModel = GameItemModel(gameTitle: content.formalName, gameOriginPrice: 10_000, gameDiscountPrice: nil, imageURL: content.heroBannerURL)
        cell.setModel(model)
        return cell
    }
    
    private func isIndicatorCell(_ indexPath: IndexPath) -> Bool {
        indexPath.row == model?.contents.count
    }
}
