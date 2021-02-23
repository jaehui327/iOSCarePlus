//
//  UIButton+Extension.swift
//  iOSCare+MVVM+SnapKit
//
//  Created by 김재희 on 2021/02/20.
//

import UIKit

extension UIButton {
    convenience init(size: CGFloat, weight: UIFont.Weight, textColor: UIColor, text: String = "") {
        self.init(frame: .zero)
        self.titleLabel?.font = UIFont.systemFont(ofSize: size, weight: weight)
        self.setTitleColor(textColor, for: .normal)
        self.setTitle(text, for: .normal)
    }
}
