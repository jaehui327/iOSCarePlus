//
//  GameItemTableViewCell.swift
//  iOSCare+MVVM+SnapKit
//
//  Created by 김재희 on 2021/02/23.
//

import Kingfisher
import SnapKit
import UIKit

class GameItemTableViewCell: UITableViewCell {
    // MARK: - UIComponents
    lazy var gameImageView: UIImageView = {
        let imageView: UIImageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 9
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.veryLightPinkTwo.cgColor
        return imageView
    }()
    
    lazy var gameTitleLabel: UILabel = {
        let label: UILabel = UILabel(size: 17, weight: .semibold, textColor: .black)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var gameOriginPriceLabel: UILabel = {
        let label: UILabel = UILabel(size: 17, weight: .regular, textColor: .veryLightPink)
        return label
    }()
    
    lazy var gameCurrentPriceLabel: UILabel = {
        let label: UILabel = UILabel(size: 17, weight: .regular, textColor: .red)
        return label
    }()
    
    // MARK: - properties
    private var model: GameItemModel? {
        didSet {
            setUIFromModel()
        }
    }
    
    // MARK: - Initializer
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - Methods
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Methods
    private func setLayout() {
        let labelStackView: UIStackView = UIStackView(frame: .zero)
        [gameImageView, gameTitleLabel, labelStackView].forEach { contentView.addSubview($0) }
        
        gameImageView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(20)
            $0.width.equalTo(UIScreen.main.bounds.width / 3.0)
            $0.height.equalTo(gameImageView.snp.width).multipliedBy(5.0 / 7.0)
        }
        
        gameTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(12)
            $0.leading.equalTo(gameImageView.snp.trailing).offset(12)
            $0.trailing.equalToSuperview().inset(12)
        }
        
        labelStackView.snp.makeConstraints {
            $0.top.equalTo(gameTitleLabel.snp.bottom)
            $0.leading.equalTo(gameTitleLabel)
//            $0.bottom.greaterThanOrEqualToSuperview().inset(10)
        }
        
        [gameOriginPriceLabel, gameCurrentPriceLabel].forEach { labelStackView.addArrangedSubview($0) }
    }
    
    func setModel(_ model: GameItemModel) {
        self.model = model
    }
    
    func setUIFromModel() {
        guard let model = model else { return }
        
        let imageURL: URL? = URL(string: model.imageURL)
        gameImageView.kf.setImage(with: imageURL)
        
        gameTitleLabel.text = model.gameTitle
        if let discountPrice: Int = model.gameDiscountPrice {
            gameCurrentPriceLabel.text = "\(discountPrice)"
            gameOriginPriceLabel.text = "\(model.gameOriginPrice)"
        } else {
            gameCurrentPriceLabel.text = "\(model.gameOriginPrice)"
            gameOriginPriceLabel.isHidden = true
        }
    }
}
