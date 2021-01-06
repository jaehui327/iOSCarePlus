//
//  SelectableButton.swift
//  iOSCarePlus
//
//  Created by JHKim on 2021/01/06.
//

import UIKit

class SelectableButton: UIButton {
    // MARK: - properties
    
    // MARK: - life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setTitleColor(UIColor(named: "black"), for: .selected)
        setTitleColor(UIColor(named: "veryLightPink"), for: .normal)
        tintColor = .clear
    }
    
    // MARK: - Methods
//    func select(_ value: Bool) {
//        if value {
//            setTitleColor(UIColor.init(named: "black"), for: .normal)
//        } else {
//            setTitleColor(UIColor.init(named: "veryLightPink"), for: .normal)
//        }
//    }
}
