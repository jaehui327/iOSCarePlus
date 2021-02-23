//
//  TabBarViewController.swift
//  iOSCare+MVVM+SnapKit
//
//  Created by 김재희 on 2021/02/20.
//

import UIKit

class TabBarViewController: UITabBarController {
    // MARK: - Vars
    lazy var homeVC: HomeViewController = {
        let homeVC: HomeViewController = HomeViewController()
        let tabBarItem: UITabBarItem = UITabBarItem(title: nil, image: UIImage(named: "homeIcon"), selectedImage: UIImage(named: "homeIcon"))
        homeVC.tabBarItem = tabBarItem
        return homeVC
    }()
    
    lazy var gameListVC: GameListViewController = {
        let gameListVC: GameListViewController = GameListViewController(viewModel: GameListViewModel())
        let tabBarItem: UITabBarItem = UITabBarItem(title: nil, image: UIImage(named: "gameIcon"), selectedImage: UIImage(named: "gameIcon"))
        gameListVC.tabBarItem = tabBarItem
        return gameListVC
    }()
    
    // MARK: - life cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tabBar.barTintColor = UIColor(named: "blackTwo")
        self.viewControllers = [homeVC, gameListVC]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
