//
//  GameListViewController.swift
//  iOSCare+MVVM+SnapKit
//
//  Created by 김재희 on 2021/02/20.
//

import SnapKit
import UIKit

class GameListViewController: UIViewController {
    // MARK: - Vars
    lazy var tableView: UITableView = {
        let tableView: UITableView = UITableView(frame: .zero, style: .grouped)
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    lazy var titleLabel: UILabel = {
        let label: UILabel = UILabel(size: 45, weight: .bold, textColor: .black, text: "Games")
        return label
    }()
    
    lazy var rankLabel: UILabel = {
        let label: UILabel = UILabel(size: 25, weight: .bold, textColor: .black, text: "Top10")
        return label
    }()
    
    lazy var rankView: UIView = {
        let view: UIView = UIView(frame: .zero)
        return view
    }()
    
    lazy var newButton: UIButton = {
        let button: UIButton = UIButton(size: 25, weight: .bold, textColor: .black, text: "New")
        return button
    }()
    
    lazy var saleButton: UIButton = {
        let button: UIButton = UIButton(size: 25, weight: .bold, textColor: .black, text: "Sale")
        return button
    }()
    
    // MARK: - properties
    private var viewModel: GameListViewModel {
        didSet {
            tableView.reloadData()
        }
    }
    
    // MARK: - Initializer
    init(viewModel: GameListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setLayout()
    }

    // MARK: - Methods
    private func setLayout() {
        [tableView].forEach { view.addSubview($0) }
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setHeaderViewLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(36)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        rankLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(35)
            $0.leading.trailing.equalTo(titleLabel)
        }
        
        rankView.snp.makeConstraints {
            $0.top.equalTo(rankLabel.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(157)
        }
        
        newButton.snp.makeConstraints {
            $0.top.equalTo(rankView.snp.bottom).offset(40)
            $0.leading.equalTo(titleLabel)
            $0.bottom.equalToSuperview().inset(20)
        }
        
        saleButton.snp.makeConstraints {
            $0.leading.equalTo(newButton.snp.trailing).offset(16)
            $0.centerY.equalTo(newButton)
        }
    }
}

// MARK: - UITableViewDelegate
extension GameListViewController: UITableViewDelegate {
}

// MARK: - UITableViewDataSource
extension GameListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView: UIView = UIView(frame: .zero)
        headerView.backgroundColor = .white
        
        [titleLabel, rankLabel, rankView, newButton, saleButton].forEach { headerView.addSubview($0) }
        
        setHeaderViewLayout()
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell()
        
        cell.selectionStyle = .none
        return cell
    }
}
