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
        let vc = HomeViewController()
        let tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "homeIcon"), selectedImage: UIImage(named: "homeIcon"))
        vc.tabBarItem = tabBarItem
        return vc
    }()
    
    lazy var gameListVC: GameListViewController = {
        let vc = GameListViewController()
        let tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "gameIcon"), selectedImage: UIImage(named: "gameIcon"))
        vc.tabBarItem = tabBarItem
        return vc
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
