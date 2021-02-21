//
//  GameListViewController.swift
//  iOSCare+MVVM+SnapKit
//
//  Created by 김재희 on 2021/02/20.
//

import UIKit

class GameListViewController: UIViewController {

    // MARK: - Vars
    lazy var titleLabel: UILabel = {
        let label = UILabel(size: 45, weight: .bold, textColor: .black, text: "Games")
        return label
    }()
    
    lazy var rankLabel: UILabel = {
        let label = UILabel(size: 25, weight: .bold, textColor: .black, text: "Top10")
        return label
    }()
    
    lazy var rankView: UIView = {
        let view = UIView(frame: .zero)
        return view
    }()
    
    lazy var newButton: UIButton = {
        let button = UIButton(size: 25, weight: .bold, textColor: .black, text: "New")
        return button
    }()
    
    lazy var saleButton: UIButton = {
        let button = UIButton(size: 25, weight: .bold, textColor: .black, text: "Sale")
        return button
    }()
    
    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
    }

    // MARK: - Methods
}
